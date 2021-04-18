/*
 * #223 "The Big Thing of the Brotherhood" creates log entries for Old and New Camp
 *
 * The dialog function will be executed twice for each condition.
 *
 * Expected behavior: There will be exactly one entry in the log topic in both cases.
 */

/*
 * Convenience function
 */
func int G1CP_Test_223_CallFunc(var int funcId, var string topic) {
    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Create the log topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, wrongLogEntry);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Count the number of entries
    var int count; count = -1;
    var int ltPtr; ltPtr = G1CP_GetTopic(topic);
    if (ltPtr) {
        var oCLogTopic lt; lt = _^(ltPtr);
        count = List_Length(lt.m_lstEntries_next);
    };

    G1CP_LogRemoveTopic(topic);

    return count;
};

/*
 * Test function
 */
func int G1CP_Test_223() {
    const string TMP_TOPIC_NAME = "G1CP Log topic 223"; // Must be unique with all certainty
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_CorKalom_BringMCQBalls_Success_Info");
    var int topicId; topicId = G1CP_Testsuite_CheckIntConst("CH1_GotoPsiCamp", 0);
    var int ncQuestId; ncQuestId = G1CP_Testsuite_CheckIntVar("Mordrag_GotoKalom", 0);
    var int ocQuestId; ocQuestId = G1CP_Testsuite_CheckIntVar("Raven_SpySect", 0);
    G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int ATR_HITPOINTS = 0;
    const int LOG_RUNNING = 1;

    const string TOPIC = ""; TOPIC = G1CP_GetIntConstI(topicId, 0, TOPIC);
    var int passed; passed = TRUE;
    var int count;

    // Backup values
    G1CP_LogRenameTopic(TOPIC, TMP_TOPIC_NAME);
    var int ncQuestBak; ncQuestBak = G1CP_GetIntVarI(ncQuestId, 0, 0);
    var int ocQuestBak; ocQuestBak = G1CP_GetIntVarI(ocQuestId, 0, 0);

    // First pass
    G1CP_SetIntVarI(ncQuestId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(ocQuestId, 0, 0);

    count = G1CP_Test_223_CallFunc(funcId, TOPIC);
    if (count > 1) {
        G1CP_TestsuiteErrorDetail("Too many log entries were created for the first condition");
        passed = FALSE;
    } else if (count == 0) {
        G1CP_TestsuiteErrorDetail("No log entry was created for the first condition");
        passed = FALSE;
    } else if (count < 0) {
        G1CP_TestsuiteErrorDetail("The log entry was not found for the first condition");
        passed = FALSE;
    };

    // Second pass
    G1CP_SetIntVarI(ncQuestId, 0, 0);
    G1CP_SetIntVarI(ocQuestId, 0, LOG_RUNNING);

    count = G1CP_Test_223_CallFunc(funcId, TOPIC);
    if (count > 1) {
        G1CP_TestsuiteErrorDetail("Too many log entries were created for the second condition");
        passed = FALSE;
    } else if (count == 0) {
        G1CP_TestsuiteErrorDetail("No log entry was created for the second condition");
        passed = FALSE;
    } else if (count < 0) {
        G1CP_TestsuiteErrorDetail("The log entry was not found for the second condition");
        passed = FALSE;
    };

    // Restore values
    G1CP_LogRenameTopic(TOPIC, TMP_TOPIC_NAME);
    G1CP_SetIntVarI(ncQuestId, 0, ncQuestBak);
    G1CP_SetIntVarI(ocQuestId, 0, ocQuestBak);

    return passed;
};
