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
func int G1CP_Test_223_CallFunc(var int funcId, var string topic, var string iter) {
    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Create the log topic
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);

    // Call the function to create the entry/entries
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Count the number of entries
    var int count; count = -1;
    var int ltPtr; ltPtr = G1CP_LogGetTopic(topic);
    if (ltPtr) {
        var oCLogTopic lt; lt = _^(ltPtr);
        count = List_Length(lt.m_lstEntries_next);
    };

    G1CP_LogRemoveTopic(topic);

    // Check the number of entries
    if (count > 1) {
        G1CP_TestsuiteErrorDetailSSS("Too many log entries were created for the ", iter, " condition");
        return FALSE;
    } else if (count == 0) {
        G1CP_TestsuiteErrorDetailSSS("No log entry was created for the ", iter, " condition");
        return FALSE;
    } else if (count < 0) {
        G1CP_TestsuiteErrorDetailSSS("The log entry was not found for the ", iter, " condition");
        return FALSE;
    } else {
        return TRUE;
    };
};

/*
 * Test function
 */
func int G1CP_Test_223() {
    const string TMP_TOPIC_NAME = "G1CP Log topic 223"; // Must be unique with all certainty
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_CorKalom_BringMCQBalls_Success_Info");
    G1CP_Testsuite_CheckStringConst("CH1_GoToPsi", 0);
    const string CH1_GotoPsiCamp = ""; CH1_GotoPsiCamp = G1CP_Testsuite_GetStringConst("CH1_GotoPsiCamp", 0);
    var int ncQuestId; ncQuestId = G1CP_Testsuite_CheckIntVar("Mordrag_GotoKalom", 0);
    var int ocQuestId; ocQuestId = G1CP_Testsuite_CheckIntVar("Raven_SpySect", 0);
    G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int ATR_HITPOINTS = 0;
    const int LOG_RUNNING = 1;

    var int passed; passed = 0;

    // Backup values
    G1CP_LogRenameTopic(CH1_GotoPsiCamp, TMP_TOPIC_NAME);
    var int ncQuestBak; ncQuestBak = G1CP_GetIntVarI(ncQuestId, 0, 0);
    var int ocQuestBak; ocQuestBak = G1CP_GetIntVarI(ocQuestId, 0, 0);

    // First pass
    G1CP_SetIntVarI(ncQuestId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(ocQuestId, 0, 0);
    passed += G1CP_Test_223_CallFunc(funcId, CH1_GotoPsiCamp, "first");

    // Second pass
    G1CP_SetIntVarI(ncQuestId, 0, 0);
    G1CP_SetIntVarI(ocQuestId, 0, LOG_RUNNING);
    passed += G1CP_Test_223_CallFunc(funcId, CH1_GotoPsiCamp, "second");

    // Restore values
    G1CP_LogRenameTopic(CH1_GotoPsiCamp, TMP_TOPIC_NAME);
    G1CP_SetIntVarI(ncQuestId, 0, ncQuestBak);
    G1CP_SetIntVarI(ocQuestId, 0, ocQuestBak);

    return (passed == 2);
};
