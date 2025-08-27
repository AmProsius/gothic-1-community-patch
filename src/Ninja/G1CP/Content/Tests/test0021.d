/*
 * #21 Fletcher reopens closed quest
 *
 * The "Sly_LostNek" quest is set to successful and the dialog function is called.
 *
 * Expected behavior: The log entry is not moved to the "running" section.
 */
func void G1CP_Test_0021() {
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Fletcher_WoNek_Info");
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_LostNek");
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupTrueGuild(hero);

    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_NONE);

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertNe(G1CP_LogGetTopicStatus(topic), LOG_RUNNING);
};
