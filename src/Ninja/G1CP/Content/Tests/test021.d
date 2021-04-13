/*
 * #21 Fletcher reopens closed quest
 *
 * The "Sly_LostNek" quest is set to successful and the dialog function is called.
 *
 * Expected behavior: The log entry is not moved to the "running" section.
 */
func int G1CP_Test_021() {
    // Define possibly missing symbols locally
    const int GIL_NONE    = 0;
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetInfoId("DIA_Fletcher_WoNek_Info");
    G1CP_Testsuite_CheckStringConst("CH1_LostNek", 0);
    G1CP_Testsuite_CheckPassed();

    // Check status of the test
    var int passed; passed = TRUE;

    // Obtain log topic name
    var string topicName; topicName = G1CP_GetStringConst("CH1_LostNek", 0 , "");

    // Backup values
    var int   topicStatusBak; topicStatusBak = G1CP_LogGetTopicStatus(topicName);
    var int   guildTrueBak;   guildTrueBak   = Npc_GetTrueGuild(hero);
    var C_Npc slfBak;         slfBak         = MEM_CpyInst(self);
    var C_Npc othBak;         othBak         = MEM_CpyInst(other);

    // Set new values
    Log_CreateTopic(topicName, LOG_MISSION);
    Log_SetTopicStatus(topicName, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_NONE);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variables now
    var int topicStatusAfter; topicStatusAfter = G1CP_LogGetTopicStatus(topicName);

    // Restore the variables
    Npc_SetTrueGuild(hero, guildTrueBak);
    if (topicStatusBak == -1) {
        G1CP_LogRemoveTopic(topicName);
    } else {
        Log_SetTopicStatus(topicName, topicStatusBak);
    };

    // Confirm the fix
    if (topicStatusAfter == LOG_RUNNING) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", topicName, "' was wrongfully set to running");
        passed = FALSE;
    };

    return passed;
};
