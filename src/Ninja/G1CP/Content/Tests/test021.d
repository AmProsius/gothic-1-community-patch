/*
 * #21 Fletcher reopens closed quest
 *
 * The "Sly_LostNek" quest is set to successful and the dialog function is called.
 *
 * Expected behavior: The log entry is not moved to the "running" section.
 */
func int G1CP_Test_021() {
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE", 0);
    const string CH1_LostNek = ""; CH1_LostNek = G1CP_Testsuite_GetStringConst("CH1_LostNek", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Fletcher_WoNek_Info");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Backup values
    var int topicStatusBak; topicStatusBak = G1CP_LogGetTopicStatus(CH1_LostNek);
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    Log_CreateTopic(CH1_LostNek, LOG_MISSION);
    Log_SetTopicStatus(CH1_LostNek, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_NONE);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variables now
    var int topicStatusAfter; topicStatusAfter = G1CP_LogGetTopicStatus(CH1_LostNek);

    // Restore the variables
    Npc_SetTrueGuild(hero, guildTrueBak);
    if (topicStatusBak == -1) {
        G1CP_LogRemoveTopic(CH1_LostNek);
    } else {
        Log_SetTopicStatus(CH1_LostNek, topicStatusBak);
    };

    // Confirm the fix
    var int passed; passed = TRUE;
    if (topicStatusAfter == LOG_RUNNING) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", CH1_LostNek, "' was wrongfully set to running");
        passed = FALSE;
    };

    return passed;
};
