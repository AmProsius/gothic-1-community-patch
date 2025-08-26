/*
 * #133 Spelling - Scatty: "Meine" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_0133() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string TEMP_TOPIC_NAME = "G1CP Test 133"; // Has to be a unique name with absolute certainty
    const string CH1_JoinOC = ""; CH1_JoinOC = G1CP_Testsuite_GetStringConst("CH1_JoinOC");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Scatty_KirgoSuccess_Info");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GRD_251_KIRGO");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_HASDEFEATEDSC");

    // Define variables for specific test
    const string logEntryWrong = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string logEntryRight = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(CH1_JoinOC, TEMP_TOPIC_NAME);

    // Check status of the test
    var int passed; passed = TRUE;

    // First pass: Call the dialog function and observe if it creates the corrected entry

    // Backup values
    var int aivarBak; aivarBak = G1CP_NpcGetAiVarI(npc, aiVarId, FALSE);

    // Set new values
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);

    // Create the topic
    Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
    Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Restore values
    G1CP_NpcSetAiVarI(npc, aiVarId, aivarBak);

    // Check if it was updated
    if (G1CP_LogHasEntry(CH1_JoinOC, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(CH1_JoinOC, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(CH1_JoinOC);

    // Second pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
    Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
    Log_AddEntry(CH1_JoinOC, logEntryWrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    if (G1CP_GetFixStatus(133) > G1CP_FIX_DISABLED) {
        var int r; r = G1CP_0133_DE_LogEntryScatty();
    };

    // Check if it was updated
    if (G1CP_LogHasEntry(CH1_JoinOC, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(CH1_JoinOC, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(CH1_JoinOC);

    // Restore the topic to how it was before
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, CH1_JoinOC);

    // Return success
    return passed;
};
