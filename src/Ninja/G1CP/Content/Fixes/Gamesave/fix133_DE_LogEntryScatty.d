/*
 * #133 Spelling - Scatty: "Meine" (DE)
 */
func int G1CP_133_DE_LogEntryScatty() {
    const string curString = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string newString = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string topicName = "";

    // Do only once per session for performance on consecutive calls
    const int topicId = -2; // -1 is reserved for invalid symbols
    const int count   = -1;
    if (topicId == -2) {
        // Find and retrieve the topic
        topicId = MEM_GetSymbolIndex("CH1_JoinOC");
        topicName = G1CP_GetStringConstI(topicId, 0, "");

        // Replace the push of the old string with the new string (this is never reverted, i.e. session fix)
        count = G1CP_ReplacePushStr(MEM_GetSymbolIndex("DIA_Scatty_KirgoSuccess_Info"), 0, curString, newString);
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
 * This function reverts the changes of #133
 */
func int G1CP_133_DE_LogEntryScattyRevert() {
    const string oldString = "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string curString = "Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.";
    const string topicName = "";

    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(133)) {
        return FALSE;
    };

    // Retrieve the topic name only once per session for performance on consecutive calls
    const int once = 0;
    if (!once) {
        topicName = G1CP_GetStringConst("CH1_JoinOC", 0, "");
        once = 1;
    };

    // Revert the log entry
    G1CP_LogReplaceEntry(topicName, curString, oldString);

    // Return success
    return TRUE;
};
