/*
 * #143 Spelling - Buster: "unterrichtet" (DE)
 */
func int G1CP_143_DE_LogEntryBuster() {
    const string curString = "Buster der Bandit unterichtet das Talent AKROBATIK.";
    const string newString = "Buster der Bandit unterrichtet das Talent AKROBATIK.";
    const string topicName = "";

    // Do only once per session for performance on consecutive calls
    const int topicId = -2; // -1 is reserved for invalid symbols
    const int count   = -1;
    if (topicId == -2) {
        // Find and retrieve the topic
        topicId = G1CP_GetStringConstId("GE_TeacherNC", 0);
        topicName = G1CP_GetStringConstI(topicId, 0, "");

        // Replace the push of the old string with the new string (this is never reverted, i.e. session fix)
        count = G1CP_ReplacePushStr(G1CP_GetFuncId("DIA_ORG_833_Buster3_Info", "void|none"), 0, curString, newString);
    };

    // Check if the log topic constant exists and if the adding of the log entry was successfully replaced
    if (topicId == -1) || (count < 1) {
        return FALSE;
    };

    // Replace the log entry
    G1CP_LogReplaceEntry(topicName, curString, newString);

    // Return success
    return TRUE;
};

/*
 * This function reverts the changes of #143
 */
func int G1CP_143_DE_LogEntryBusterRevert() {
    const string oldString = "Buster der Bandit unterichtet das Talent AKROBATIK.";
    const string curString = "Buster der Bandit unterrichtet das Talent AKROBATIK.";
    const string topicName = "";

    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(143)) {
        return FALSE;
    };

    // Retrieve the topic name only once per session for performance on consecutive calls
    const int once = 0;
    if (!once) {
        topicName = G1CP_GetStringConst("GE_TeacherNC", 0, "");
        once = 1;
    };

    // Revert the log entry
    G1CP_LogReplaceEntry(topicName, curString, oldString);

    // Return success
    return TRUE;
};
