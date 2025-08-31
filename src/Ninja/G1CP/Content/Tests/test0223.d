/*
 * #223 "The Big Thing of the Brotherhood" creates log entries for Old and New Camp
 *
 * The dialog function will be executed twice for each condition.
 *
 * Expected behavior: There will be exactly one entry in the log topic in both cases.
 */
func void G1CP_Test_0223() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_CorKalom_BringMCQBalls_Success_Info");
    G1CP_Testsuite_CheckStringConst("CH1_GoToPsi");
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_GotoPsiCamp");
    var int ncQuestId; ncQuestId = G1CP_Testsuite_CheckIntVar("Mordrag_GotoKalom");
    var int ocQuestId; ocQuestId = G1CP_Testsuite_CheckIntVar("Raven_SpySect");
    G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupInt(ncQuestId, 0);
    G1CP_Testsuite_BackupInt(ocQuestId, 0);

    // Check for variable Mordrag_GotoKalom
    G1CP_SetIntVarI(ncQuestId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(ocQuestId, 0, 0);
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogCountEntries(topic), 1);
    G1CP_LogRemoveTopic(topic);

    // Check for variable Raven_SpySect
    G1CP_SetIntVarI(ncQuestId, 0, 0);
    G1CP_SetIntVarI(ocQuestId, 0, LOG_RUNNING);
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogCountEntries(topic), 1);
};
