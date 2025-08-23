/*
 * #121 Spelling - Quest: "Shrikes Hütte" (DE)
 *
 * The content of the string constant will be checked and a log topic will be temporarily created with the original
 * topic name. After applying the fix, its name should be updated correctly.
 *
 * Expected behavior: The wording of the constant and the log topic name will be correct.
 */
func int G1CP_Test_0121() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string logTopicRight = "Shrikes Hütte";
    const string CH1_ShrikesHut = ""; CH1_ShrikesHut = G1CP_Testsuite_GetStringConst("CH1_ShrikesHut");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    var int passed; passed = TRUE;

    // First test: Check if the name is correct in the string constant

    if (!Hlp_StrCmp(CH1_ShrikesHut, logTopicRight)) {
        G1CP_TestsuiteErrorDetailSSS("Topic name string constant has incorrect content: '", CH1_ShrikesHut, "'");
        passed = FALSE;
    };

    // Second test: Check if an existing topic is updated in the log
    // For that, we first revert the fix, then create the log topic (with potentially incorrect name), then apply
    // the fix and finally confirm that the name was correctly updated

    // Remember for later if the log topic already exists
    var int topicBakPtr; topicBakPtr = G1CP_LogGetTopic(CH1_ShrikesHut);

    // Revert the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_0121_DE_LogTopicShrikeHutRevert();

    // Create the topic with original name temporarily (if it does not exist already)
    Log_CreateTopic(CH1_ShrikesHut, LOG_MISSION);
    var int topicTempPtr; topicTempPtr = G1CP_LogGetTopic(CH1_ShrikesHut);

    // Apply the fix again (careful now, don't overwrite the fix status!)
    r = G1CP_0121_DE_LogTopicShrikeHut();

    // Check if - for some reason - the log topic was not created
    if (!topicTempPtr) {
        G1CP_TestsuiteErrorDetail("Log topic could not be created");
        return FALSE;
    };

    // Check if its name was updated
    var oCLogTopic topicTemp; topicTemp = _^(topicTempPtr);
    if (!Hlp_StrCmp(topicTemp.m_strDescription, logTopicRight)) {
        G1CP_TestsuiteErrorDetailSSS("Log topic name was not updated: '", topicTemp.m_strDescription, "'");
        passed = FALSE;
    };

    // Remove the temporary log topic
    if (topicTempPtr != topicBakPtr) {
        G1CP_LogRemoveTopic(topicTemp.m_strDescription);
    };

    // Return success
    return passed;
};
