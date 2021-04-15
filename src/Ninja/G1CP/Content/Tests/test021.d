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

    // Define constants for specific test
    const string TOPIC_NAME = "CH1_LostNek";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogFuncId("DIA_Fletcher_WoNek_Info");
    G1CP_Testsuite_CheckStringConst(TOPIC_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const string TOPIC = ""; TOPIC = G1CP_GetStringConst(TOPIC_NAME, 0 , "");

    // Backup values
    var int   topicStatusBak; topicStatusBak = G1CP_LogGetTopicStatus(TOPIC);
    var int   guildTrueBak;   guildTrueBak   = Npc_GetTrueGuild(hero);
    var C_Npc slfBak;         slfBak         = MEM_CpyInst(self);
    var C_Npc othBak;         othBak         = MEM_CpyInst(other);

    // Set new values
    Log_CreateTopic(TOPIC, LOG_MISSION);
    Log_SetTopicStatus(TOPIC, LOG_SUCCESS);
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
    var int topicStatusAfter; topicStatusAfter = G1CP_LogGetTopicStatus(TOPIC);

    // Restore the variables
    Npc_SetTrueGuild(hero, guildTrueBak);
    if (topicStatusBak == -1) {
        G1CP_LogRemoveTopic(TOPIC);
    } else {
        Log_SetTopicStatus(TOPIC, topicStatusBak);
    };

    // Confirm the fix
    var int passed; passed = TRUE;
    if (topicStatusAfter == LOG_RUNNING) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", TOPIC, "' was wrongfully set to running");
        passed = FALSE;
    };

    return passed;
};
