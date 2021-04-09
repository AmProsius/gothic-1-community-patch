/*
 * #93 Spelling - Horatio: "zuzuschlagen" (DE)
 */
func int G1CP_093_DE_LogEntryHoratio() {
    // I'm sorry for not breaking the line at 120 characters
    const string curString = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string newString = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschlagen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string topicName = "";

    // Do only once per session for performance on consecutive calls
    const int topicId = -2; // -1 is reserved for invalid symbols
    const int count   = -1;
    if (topicId == -2) {
        // Find and retrieve the topic
        topicId = MEM_GetSymbolIndex("CH1_HoratiosTeachings");
        topicName = G1CP_GetStringVarByIndex(topicId, 0, "");

        // Replace the push of the old string with the new string (this is never reverted, i.e. session fix)
        count = G1CP_ReplacePushStr(MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR_Info"), 0, curString, newString);
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
 * This function reverts the changes of #93
 */
func int G1CP_093_DE_LogEntryHoratioRevert() {
    // I'm sorry for not breaking the line at 120 characters
    const string oldString = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string curString = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschlagen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string topicName = "";

    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(93)) {
        return FALSE;
    };

    // Retrieve the topic name only once per session for performance on consecutive calls
    const int once = 0;
    if (!once) {
        topicName = G1CP_GetStringVar("CH1_HoratiosTeachings", 0, "");
        once = 1;
    };

    // Revert the log entry
    G1CP_LogReplaceEntry(topicName, curString, oldString);

    // Return success
    return TRUE;
};
