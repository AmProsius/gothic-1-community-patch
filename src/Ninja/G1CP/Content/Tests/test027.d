/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func int G1CP_Test_027() {
    // Define variables for specific test
    var string bierBekommenName; bierBekommenName = "drax_bierbekommen";
    var string lehrerFreiName;   lehrerFreiName   = "drax_Lehrer_frei";
    var string topicName;        topicName        = "GE_TeacherOW";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogFuncId("Org_819_Drax_Scavenger_Info");
    var int beerId; beerId = G1CP_Testsuite_GetItemId("ItFoBeer");
    G1CP_Testsuite_CheckIntVar(bierBekommenName, 0);
    G1CP_Testsuite_CheckIntVar(lehrerFreiName, 0);
    G1CP_Testsuite_CheckIntConst(topicName, 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    var int GE_TeacherOW; GE_TeacherOW = G1CP_GetStringConst(topicName, 0, 0);

    // Rename the log topic if it already exists
    const string tempTopicName = "G1CP Test 27"; // Has to be a unique name with absolute certainty
    G1CP_LogRenameTopic(GE_TeacherOW, tempTopicName);

    // Backup values
    var int   beersBefore;  beersBefore  = Npc_HasItems(hero, beerId);
    var int   beerGivenBak; beerGivenBak = G1CP_GetIntVar(bierBekommenName, 0, 0);
    var int   teachingBak;  teachingBak  = G1CP_GetIntVar(lehrerFreiName, 0, 0);
    var C_Npc slfBak;       slfBak       = MEM_CpyInst(self);
    var C_Npc othBak;       othBak       = MEM_CpyInst(other);

    // Set self and other
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
    G1CP_SetIntVar(bierBekommenName, 0, FALSE);
    G1CP_SetIntVar(lehrerFreiName, 0, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated     = G1CP_LogGetTopic(GE_TeacherOW) != 0;
    teachingUnlocked = G1CP_GetIntVar(lehrerFreiName, 0, 0);
    if (topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", topicName, "' was wrongfully created");
    };
    if (teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", lehrerFreiName, "' was wrongfully set to true");
    };
    pass1passed = (!topicCreated) && (!teachingUnlocked);

    // Remove possibly created log topic
    G1CP_LogRemoveTopic(GE_TeacherOW);

    // Second pass: Has beer, variable should be set to true and log entry should be created

    // Set variables
    CreateInvItem(hero, beerId);
    G1CP_SetIntVar(bierBekommenName, 0, FALSE);
    G1CP_SetIntVar(lehrerFreiName, 0, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated     = G1CP_LogGetTopic(GE_TeacherOW) != 0;
    teachingUnlocked = G1CP_GetIntVar(lehrerFreiName, 0, 0);
    if (!topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", topicName, "' was not created");
    };
    if (!teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", lehrerFreiName, "' was not set to true");
    };
    pass2passed = (topicCreated) && (teachingUnlocked);

    // Remove possibly created log topic and remove any beers
    G1CP_LogRemoveTopic(GE_TeacherOW);
    Npc_RemoveInvItems(hero, beerId, Npc_HasItems(hero, beerId));

    // Clean up

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Restore values
    G1CP_SetIntVar(bierBekommenName, 0, beerGivenBak);
    G1CP_SetIntVar(lehrerFreiName, 0, teachingBak);
    G1CP_LogRenameTopic(tempTopicName, GE_TeacherOW);
    if (beersBefore > 0) {
        CreateInvItems(hero, beerId, beersBefore);
    };

    // Confirm the fix
    return (pass1passed) && (pass2passed);
};
