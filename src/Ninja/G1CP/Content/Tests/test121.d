/*
 * #121 Spelling - Quest: "Shrikes Hütte" (DE)
 *
 * The content of the string constant will be checked and a log topic will be temporarily created with the original
 * topic name. After applying the fix, its name should be updated correctly.
 *
 * Expected behavior: The wording of the constant and the log topic name will be correct.
 */
func int G1CP_Test_121() {
    var int passed; passed = TRUE;
    const string right = "Shrikes Hütte";

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex("CH1_ShrikesHut") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'CH1_ShrikesHut' not found");
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string topic; topic = G1CP_GetStringVar("CH1_ShrikesHut", 0, "G1CP invalid string");

    // First test: Check if the name is correct in the string constant

    if (!Hlp_StrCmp(topic, right)) {
        G1CP_TestsuiteErrorDetail(ConcatStrings("Variable 'CH1_ShrikesHut' has incorrect content: ", topic));
        passed = FALSE;
    };

    // Second test: Check if an existing topic is updated in the log
    // For that, we first revert the fix, then create the log topic (with potentially incorrect name), then apply
    // the fix and finally confirm that the name was correctly updated

    // Remember for later if the log topic already exists
    var int topicBakPtr; topicBakPtr = G1CP_LogGetTopic(topic);

    // Revert the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_121_DE_LogTopicShrikeHutRevert();
    topic = G1CP_GetStringVar("CH1_ShrikesHut", 0, "G1CP invalid string"); // Original topic name

    // Create the topic with original name temporarily (if it does not exist already)
    Log_CreateTopic(topic, LOG_MISSION);
    var int topicTempPtr; topicTempPtr = G1CP_LogGetTopic(topic);

    // Apply the fix again (careful now, don't overwrite the fix status!)
    r = G1CP_121_DE_LogTopicShrikeHut();

    // Check if - for some reason - the log topic was not created
    if (!topicTempPtr) {
        G1CP_TestsuiteErrorDetail("Log topic could not be created");
        return FALSE;
    };

    // Check if its name was updated
    var oCLogTopic topicTemp; topicTemp = _^(topicTempPtr);
    if (!Hlp_StrCmp(topicTemp.m_strDescription, right)) {
        G1CP_TestsuiteErrorDetail(ConcatStrings("Log topic name was not updated: ", topicTemp.m_strDescription));
        passed = FALSE;
    };

    // Remove the temporary log topic
    if (topicTempPtr != topicBakPtr) {
        G1CP_LogRemoveTopic(topicTemp.m_strDescription);
    };

    // Return success
    return passed;
};
