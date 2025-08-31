/*
 * #121 Spelling - Quest: "Shrikes Hütte" (DE)
 *
 * The content of the string constant will be checked and a log topic will be temporarily created with the original
 * topic name. After applying the fix, its name should be updated correctly.
 *
 * Expected behavior: The wording of the constant and the log topic name will be correct.
 */
func void G1CP_Test_0121() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_ShrikesHut");
    const string logTopicIncorrect = "Shrike's Hütte";
    const string logTopicCorrect = "Shrikes Hütte";
    const int LOG_MISSION = 0;

    G1CP_Testsuite_BackupTopic(logTopicIncorrect);
    G1CP_Testsuite_BackupTopic(logTopicCorrect);

    // Check if constant was updated
    G1CP_Testsuite_AssertS(topic, logTopicCorrect);

    // Check if an existing topic is updated in the log
    Log_CreateTopic(logTopicIncorrect, LOG_MISSION);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(logTopicIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(logTopicCorrect), TRUE);
};
