/*
 * #234 Spelling - Drax: "Orkhund" (DE)
 */
func int G1CP_234_DE_LogEntryDrax() {
    const string curString = "Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.";
    const string newString = "Wissen über Zähne entfernen - Wolf, Orkhund, Snapper, Beißer, Bluthund, Schattenläufer.";
    const string topicName = "";

    // Do only once per session for performance on consecutive calls
    const int topicId = -2; // -1 is reserved for invalid symbols
    const int count   = -1;
    if (topicId == -2) {
        // Find and retrieve the topic
        topicId = G1CP_GetStringConstId("GE_AnimalTrophies", 0);
        topicName = G1CP_GetStringConstI(topicId, 0, "");

        // Replace the push of the old string with the new string (this is never reverted, i.e. session fix)
        var int symbId; symbId = G1CP_GetFuncId("Org_819_Drax_Creatures_Zahn", "void|none");
        count = G1CP_ReplacePushStr(symbId, 0, curString, newString);
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
 * This function reverts the changes of #234
 */
func int G1CP_234_DE_LogEntryDraxRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(234)) {
        return FALSE;
    };

    const string oldString = "Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.";
    const string curString = "Wissen über Zähne entfernen - Wolf, Orkhund, Snapper, Beißer, Bluthund, Schattenläufer.";
    const string topicName = "";

    // Retrieve the topic name only once per session for performance on consecutive calls
    const int once = 0;
    if (!once) {
        topicName = G1CP_GetStringConst("GE_AnimalTrophies", 0, "");
        once = 1;
    };

    // Revert the log entry
    G1CP_LogReplaceEntry(topicName, curString, oldString);

    // Return success
    return TRUE;
};
