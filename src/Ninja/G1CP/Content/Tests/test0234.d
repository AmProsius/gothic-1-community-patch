/*
 * #234 Spelling - Drax: "Orkhund" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_0234() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string TEMP_TOPIC_NAME = "G1CP Test 234"; // Has to be a unique name with absolute certainty
    const string GE_AnimalTrophies = ""; GE_AnimalTrophies = G1CP_Testsuite_GetStringConst("GE_AnimalTrophies");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Org_819_Drax_Creatures_Zahn");
    var int skillId; skillId = G1CP_Testsuite_CheckIntVar("Knows_GetTeeth");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMinugget");

    // Define variables for specific test
    // I'm sorry for not breaking the line at 120 characters
    const string logEntryWrong = "Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.";
    const string logEntryRight = "Wissen über Zähne entfernen - Wolf, Orkhund, Snapper, Beißer, Bluthund, Schattenläufer.";

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(GE_AnimalTrophies, TEMP_TOPIC_NAME);

    // Check status of the test
    var int passed; passed = TRUE;

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(GE_AnimalTrophies, LOG_MISSION);
    Log_SetTopicStatus(GE_AnimalTrophies, LOG_RUNNING);
    Log_AddEntry(GE_AnimalTrophies, logEntryWrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_0234_DE_LogEntryDrax();

    // Check if it was updated
    if (G1CP_LogHasEntry(GE_AnimalTrophies, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(GE_AnimalTrophies, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(GE_AnimalTrophies);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    // Backup values
    var int skillBak; skillBak = G1CP_GetIntVarI(skillId, 0, 0);
    var int oreBefore; oreBefore = Npc_HasItems(hero, oreId);
    var int lpBak; lpBak = hero.lp;

    // Set new values
    CreateInvItems(hero, oreId, 50); // Add 50 ore for the condition within the dialog
    hero.lp = hero.lp + 1;

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if log was updated
    if (G1CP_LogHasEntry(GE_AnimalTrophies, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(GE_AnimalTrophies, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };

    // Restore values
    G1CP_LogRemoveTopic(GE_AnimalTrophies);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, GE_AnimalTrophies);
    G1CP_SetIntVarI(skillId, 0, skillBak);
    hero.lp = lpBak;

    // Restore the amount of ore
    var int oreAfter; oreAfter = Npc_HasItems(hero, oreId);
    if (oreAfter > 0) {
        Npc_RemoveInvItems(hero, oreId, oreAfter);
    };
    if (oreBefore > 0) {
        CreateInvItems(hero, oreId, oreBefore);
    };

    // Return success
    return passed;
};
