/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func int G1CP_Test_027() {
    // Define variables for specific test
    const string BIER_BEKOMMEN_NAME = "drax_bierbekommen";
    const string LEHRER_FREI_NAME = "drax_Lehrer_frei";
    const string TOPIC_NAME = "GE_TeacherOW";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogFuncId("Org_819_Drax_Scavenger_Info");
    var int itemId; itemId = G1CP_Testsuite_GetItemId("ItFoBeer");
    G1CP_Testsuite_CheckIntVar(BIER_BEKOMMEN_NAME, 0);
    G1CP_Testsuite_CheckIntVar(LEHRER_FREI_NAME, 0);
    G1CP_Testsuite_CheckIntConst(TOPIC_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const string TOPIC = ""; TOPIC = G1CP_GetStringConst(TOPIC_NAME, 0, 0);

    // Rename the log topic if it already exists
    const string TEMP_TOPIC_NAME = "G1CP Test 27"; // Has to be a unique name with absolute certainty
    G1CP_LogRenameTopic(TOPIC, TEMP_TOPIC_NAME);

    // Backup values
    var int beersBefore; beersBefore = Npc_HasItems(hero, itemId);
    var int beerGivenBak; beerGivenBak = G1CP_GetIntVar(BIER_BEKOMMEN_NAME, 0, 0);
    var int teachingBak; teachingBak = G1CP_GetIntVar(LEHRER_FREI_NAME, 0, 0);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

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
    G1CP_SetIntVar(BIER_BEKOMMEN_NAME, 0, FALSE);
    G1CP_SetIntVar(LEHRER_FREI_NAME, 0, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(TOPIC) != 0;
    teachingUnlocked = G1CP_GetIntVar(LEHRER_FREI_NAME, 0, 0);
    if (topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", TOPIC_NAME, "' was wrongfully created");
    };
    if (teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", LEHRER_FREI_NAME, "' was wrongfully set to true");
    };
    pass1passed = (!topicCreated) && (!teachingUnlocked);

    // Remove possibly created log topic
    G1CP_LogRemoveTopic(TOPIC);

    // Second pass: Has beer, variable should be set to true and log entry should be created

    // Set variables
    CreateInvItem(hero, itemId);
    G1CP_SetIntVar(BIER_BEKOMMEN_NAME, 0, FALSE);
    G1CP_SetIntVar(LEHRER_FREI_NAME, 0, FALSE);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variable and log topic
    topicCreated = G1CP_LogGetTopic(TOPIC) != 0;
    teachingUnlocked = G1CP_GetIntVar(LEHRER_FREI_NAME, 0, 0);
    if (!topicCreated) {
        G1CP_TestsuiteErrorDetailSSS("Log note '", TOPIC_NAME, "' was not created");
    };
    if (!teachingUnlocked) {
        G1CP_TestsuiteErrorDetailSSS("Variable '", LEHRER_FREI_NAME, "' was not set to true");
    };
    pass2passed = (topicCreated) && (teachingUnlocked);

    // Remove possibly created log topic and remove any beers
    G1CP_LogRemoveTopic(TOPIC);
    Npc_RemoveInvItems(hero, itemId, Npc_HasItems(hero, itemId));

    // Clean up

    // Restore self and other
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Restore values
    G1CP_SetIntVar(BIER_BEKOMMEN_NAME, 0, beerGivenBak);
    G1CP_SetIntVar(LEHRER_FREI_NAME, 0, teachingBak);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, TOPIC);
    if (beersBefore > 0) {
        CreateInvItems(hero, itemId, beersBefore);
    };

    // Confirm the fix
    return (pass1passed) && (pass2passed);
};
