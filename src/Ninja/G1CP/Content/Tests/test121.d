/*
 * #121 Spelling - Quest: "Shrikes Hütte" (DE)
 */
func int G1CP_Test_121() {
    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test only applicable for the German localization");
        return TRUE; // True?
    };

    // Check if the constant exists
    if (MEM_GetSymbolIndex("G1CP_GetStringVar") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'G1CP_GetStringVar' not found");
        return FALSE;
    };

    // Retrieve the content of the log topic string constant
    var string CH1_ShrikesHut; CH1_ShrikesHut = G1CP_GetStringVar("CH1_ShrikesHut", 0, "G1CP invalid string");

    // Backup the status of the log topic if it exists already
    var int sectionBak; sectionBak = G1CP_GetTopicSection(CH1_ShrikesHut);

    // Create the topic if it does not exist yet
    Log_CreateTopic(CH1_ShrikesHut, LOG_MISSION);

    // Check if the log topic exists as expected
    var int passed; passed = TRUE;
    const string wrong = "Shrike's Hütte";
    const string right = "Shrikes Hütte";
    if (G1CP_GetTopic(wrong)) {
        G1CP_TestsuiteErrorDetail("Log topic 'Shrike's Hütte' wrongfully exists");
        passed = FALSE;
    };
    if (!G1CP_GetTopic(right)) {
        G1CP_TestsuiteErrorDetail("Log topic 'Shrikes Hütte' wrongfully does not exist");
        passed = FALSE;
    };

    // Restore the topic to how it was before
    if (sectionBak == -1) {
        G1CP_RemoveTopic(CH1_ShrikesHut);
    } else {
        G1CP_SetTopicSection(CH1_ShrikesHut, sectionBak);
    };

    // Return success
    return passed;
};
