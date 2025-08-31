/*
 * #133 Spelling - Scatty: "Meine" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func void G1CP_Test_0133() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Scatty_KirgoSuccess_Info");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GRD_251_KIRGO");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_HASDEFEATEDSC");
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_JoinOC");
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const string logEntryIncorrect = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string logEntryCorrect = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupAiVar(npc, aiVarId);
    G1CP_Testsuite_BackupFixStatus();

    // Call the dialog function and observe if it creates the corrected entry
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
    G1CP_LogRemoveTopic(topic);

    // Create the log topic with the faulty entry and see if the fix will update it
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, logEntryIncorrect);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
};
