/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func int G1CP_Test_027() {
    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogFuncId("Org_819_Drax_Scavenger_Info");

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("Org_819_Drax_Scavenger_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'Org_819_Drax_Scavenger_Info' not found");
        passed = FALSE;
    };

    // Check if the beer item exists
    var int beerId; beerId = MEM_GetSymbolIndex("ItFoBeer");
    if (beerId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItFoBeer' not found");
        passed = FALSE;
    };

    // Get variables
    var int beerGivenPtr; beerGivenPtr = MEM_GetSymbol("drax_bierbekommen");
    if (!beerGivenPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'drax_bierbekommen' not found");
        passed = FALSE;
    };
    beerGivenPtr += zCParSymbol_content_offset;
    var int teachingPtr; teachingPtr = MEM_GetSymbol("drax_Lehrer_frei");
    if (!teachingPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'drax_Lehrer_frei' not found");
        passed = FALSE;
    };
    teachingPtr += zCParSymbol_content_offset;

    // Obtain log topic name
    var string GE_TeacherOW;
    var int topicNamePtr; topicNamePtr = MEM_GetSymbol("GE_TeacherOW");
    if (topicNamePtr) {
        GE_TeacherOW = MEM_ReadString(MEM_ReadInt(topicNamePtr + zCParSymbol_content_offset));
    } else {
        G1CP_TestsuiteErrorDetail("Variable 'GE_TeacherOW' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Rename the log topic if it already exists
    const string tempTopicName = "G1CP Test 27"; // Has to be a unique name with absolute certainty
    G1CP_LogRenameTopic(GE_TeacherOW, tempTopicName);

    // Backup values
    var int beersBefore; beersBefore = Npc_HasItems(hero, beerId);
    var int beerGivenBak; beerGivenBak = MEM_ReadInt(beerGivenPtr);
    var int teachingBak; teachingBak = MEM_ReadInt(teachingPtr);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Backup self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Do two passes
    var int pass1passed;
    var int pass2passed;
    var int topicCreated;
    var int teachingUnlocked;

    // First pass: No beer, variable should remain false and log entry not created

    // Set variables
    if (beersBefore > 0) {
        Npc_RemoveInvItems(hero, beerId, beersBefore);
    };
    MEM_WriteInt(beerGivenPtr, FALSE);
    MEM_WriteInt(teachingPtr, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(GE_TeacherOW) != 0;
    teachingUnlocked = MEM_ReadInt(teachingPtr);
    if (topicCreated) {
        G1CP_TestsuiteErrorDetail("Log note 'GE_TeacherOW' was wrongfully created");
    };
    if (teachingUnlocked) {
        G1CP_TestsuiteErrorDetail("Variable 'drax_Lehrer_frei' was wrongfully set to true");
    };
    pass1passed = (!topicCreated) && (!teachingUnlocked);

    // Remove possibly created log topic
    G1CP_LogRemoveTopic(GE_TeacherOW);

    // Second pass: Has beer, variable should be set to true and log entry should be created

    // Set variables
    CreateInvItem(hero, beerId);
    MEM_WriteInt(beerGivenPtr, FALSE);
    MEM_WriteInt(teachingPtr, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(GE_TeacherOW) != 0;
    teachingUnlocked = MEM_ReadInt(teachingPtr);
    if (!topicCreated) {
        G1CP_TestsuiteErrorDetail("Log note 'GE_TeacherOW' was not created");
    };
    if (!teachingUnlocked) {
        G1CP_TestsuiteErrorDetail("Variable 'drax_Lehrer_frei' was not set to true");
    };
    pass2passed = (topicCreated) && (teachingUnlocked);

    // Remove possibly created log topic and remove any beers
    G1CP_LogRemoveTopic(GE_TeacherOW);
    Npc_RemoveInvItems(hero, beerId, Npc_HasItems(hero, beerId));

    // Clean up

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Revert values
    MEM_WriteInt(teachingPtr, teachingBak);
    MEM_WriteInt(beerGivenPtr, beerGivenBak);
    G1CP_LogRenameTopic(tempTopicName, GE_TeacherOW);
    if (beersBefore > 0) {
        CreateInvItems(hero, beerId, beersBefore);
    };

    // Confirm the fix
    return (pass1passed) && (pass2passed);
};
