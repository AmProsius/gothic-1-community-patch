/*
 * #21 Fletcher reopens closed quest
 *
 * The "Sly_LostNek" quest is set to successful and the dialog function is called.
 *
 * Expected behavior: The log entry is not moved to the "running" section.
 */
func int Ninja_G1CP_Test_021() {
    // Define possibly missing symbols locally
    const int GIL_NONE    = 0;
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Fletcher_WoNek_Info");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog function 'DIA_Fletcher_WoNek_Info' not found");
        passed = FALSE;
    };

    // Obtain log topic name
    var string CH1_LostNek;
    var int topicNamePtr; topicNamePtr = MEM_GetSymbol("CH1_LostNek");
    if (topicNamePtr) {
        CH1_LostNek = MEM_ReadString(MEM_ReadInt(topicNamePtr + zCParSymbol_content_offset));
    } else {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'CH1_LostNek' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Back up the values
    var int topicStatusBak; topicStatusBak = Ninja_G1CP_GetTopicStatus(CH1_LostNek);
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero);

    // Set the variables
    Log_CreateTopic(CH1_LostNek, LOG_MISSION);
    Log_SetTopicStatus(CH1_LostNek, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_NONE);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
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
    var int topicStatusAfter; topicStatusAfter = Ninja_G1CP_GetTopicStatus(CH1_LostNek);

    // Restore the variables
    Npc_SetTrueGuild(hero, guildTrueBak);
    if (topicStatusBak == -1) {
        Ninja_G1CP_RemoveTopic(CH1_LostNek);
    } else {
        Log_SetTopicStatus(CH1_LostNek, topicStatusBak);
    };

    // Confirm the fix
    if (topicStatusAfter == LOG_RUNNING) {
        Ninja_G1CP_TestsuiteErrorDetail("Mission 'CH1_LostNek' was wrongfully set to running");
        passed = FALSE;
    };

    return passed;
};
