/*
 * #21 Fletcher reopens closed quest
 *
 * The "Sly_LostNek" quest is set to successful and the dialog function is called.
 *
 * Expected behavior: The log entry is not moved to the "running" section.
 */
func int G1CP_Test_0021() {
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");
    const string CH1_LostNek = ""; CH1_LostNek = G1CP_Testsuite_GetStringConst("CH1_LostNek");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Fletcher_WoNek_Info");
    G1CP_Testsuite_CheckPassed();

    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    var int topicStatusBak; topicStatusBak = G1CP_LogGetTopicStatus(CH1_LostNek);
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero);
    if (final()) {
        Npc_SetTrueGuild(hero, guildTrueBak);
        if (topicStatusBak == -1) {
            G1CP_LogRemoveTopic(CH1_LostNek);
        } else {
            Log_SetTopicStatus(CH1_LostNek, topicStatusBak);
        };
    };

    Log_CreateTopic(CH1_LostNek, LOG_MISSION);
    Log_SetTopicStatus(CH1_LostNek, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_NONE);

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertNe(G1CP_LogGetTopicStatus(CH1_LostNek), LOG_RUNNING);

    return TRUE;
};
