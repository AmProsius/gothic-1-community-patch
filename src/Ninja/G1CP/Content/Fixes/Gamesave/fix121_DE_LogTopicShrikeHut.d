/*
 * #121 Spelling - Quest: "Shrikes Hütte" (DE)
 */
func int G1CP_121_DE_LogTopicShrikeHut() {
    const string newName = "Shrikes Hütte";
    var string curName; curName = G1CP_GetStringConst("CH1_ShrikesHut", "");

    if (Hlp_StrCmp(curName, "Shrike's Hütte")) {
        G1CP_SetStringConst("CH1_ShrikesHut", newName);
        G1CP_LogRenameTopic(curName, newName);
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function reverts the changes of #121
 */
func int G1CP_121_DE_LogTopicShrikeHutRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(121)) {
        return FALSE;
    };

    const string oldName = "Shrike's Hütte";
    var string curName; curName = G1CP_GetStringConst("CH1_ShrikesHut", "");

    if (Hlp_StrCmp(curName, "Shrikes Hütte")) {
        G1CP_SetStringConst("CH1_ShrikesHut", oldName); // Necessary for re-applying
        G1CP_LogRenameTopic(curName, oldName);
        return TRUE;
    } else {
        return FALSE;
    };
};
