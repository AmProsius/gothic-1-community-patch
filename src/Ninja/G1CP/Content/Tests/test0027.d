/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func int G1CP_Test_0027() {
    const string TEMP_TOPIC_NAME = "G1CP Test 27"; // Has to be a unique name with absolute certainty
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Org_819_Drax_Scavenger_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItFoBeer");
    var int var1Id; var1Id = G1CP_Testsuite_CheckIntVar("drax_bierbekommen", 0);
    var int var2Id; var2Id = G1CP_Testsuite_CheckIntVar("drax_Lehrer_frei", 0);
    var int topicId; topicId = G1CP_Testsuite_CheckStringConst("GE_TeacherOW", 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const string TOPIC = ""; TOPIC = G1CP_GetStringConstI(topicId, 0, TOPIC);

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(TOPIC, TEMP_TOPIC_NAME);

    // Backup values
    var int beersBefore; beersBefore = Npc_HasItems(hero, itemId);
    var int beerGivenBak; beerGivenBak = G1CP_GetIntVarI(var1Id, 0, 0);
    var int teachingBak; teachingBak = G1CP_GetIntVarI(var2Id, 0, 0);

    // Do two passes
    var int pass1passed;
    var int pass2passed;
    var int topicCreated;
    var int teachingUnlocked;

    // First pass: No beer, variable should remain false and log entry not created

    // Set variables
    if (beersBefore > 0) {
        Npc_RemoveInvItems(hero, itemId, beersBefore);
    };
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(TOPIC) != 0;
    teachingUnlocked = G1CP_GetIntVarI(var2Id, 0, 0);
    if (topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", G1CP_GetSymbolName(topicId), "' was wrongfully created");
    };
    if (teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", G1CP_GetSymbolName(var2Id), "' was wrongfully set to true");
    };
    pass1passed = (!topicCreated) && (!teachingUnlocked);

    // Remove possibly created log topic
    G1CP_LogRemoveTopic(TOPIC);

    // Second pass: Has beer, variable should be set to true and log entry should be created

    // Set variables
    CreateInvItem(hero, itemId);
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(TOPIC) != 0;
    teachingUnlocked = G1CP_GetIntVarI(var2Id, 0, 0);
    if (!topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", G1CP_GetSymbolName(topicId), "' was not created");
    };
    if (!teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", G1CP_GetSymbolName(var2Id), "' was not set to true");
    };
    pass2passed = (topicCreated) && (teachingUnlocked);

    // Remove possibly created log topic and remove any beers
    G1CP_LogRemoveTopic(TOPIC);
    Npc_RemoveInvItems(hero, itemId, Npc_HasItems(hero, itemId));

    // Clean up

    // Restore values
    G1CP_SetIntVarI(var1Id, 0, beerGivenBak);
    G1CP_SetIntVarI(var2Id, 0, teachingBak);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, TOPIC);
    if (beersBefore > 0) {
        CreateInvItems(hero, itemId, beersBefore);
    };

    // Confirm the fix
    return (pass1passed) && (pass2passed);
};
