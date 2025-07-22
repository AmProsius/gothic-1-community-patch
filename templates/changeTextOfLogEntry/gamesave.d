/*
 * #{ISSUE_NUM} {LONGNAME}
 */

/*
 * Make the topic and strings available to the functions below
 */
const string G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Topic = "### TODO: Topic name ###";
const string G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OrginialStr = "### TODO: Original string ###";
const string G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedStr = "### TODO: Corrected string ###";

/*
 * Apply the fix
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string symbolName = "### TODO: Symbol name ###";
    const string topicName = "";
    const int topicId = -2;
    const int count = -1;

    if (topicId == -2) {
        topicId = G1CP_GetStringConstId(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Topic, 0);
        topicName = G1CP_GetStringConstI(topicId, 0, "");

        var int symbId; symbId = G1CP_GetFuncId(symbolName, "void|none");
        count = G1CP_ReplacePushStr(symbId, 0, G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OrginialStr,
            G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedStr);
    };

    if (topicId == -1) || (count < 1) {
        return FALSE;
    };

    G1CP_LogReplaceEntry(topicName, G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OrginialStr,
        G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedStr);
    return TRUE;
};

/*
 * This function reverts the changes of #{ISSUE_NUM}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    const string topicName = "";
    const int once = 0;

    if (!once) {
        topicName = G1CP_GetStringConst(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Topic, 0, "");
        once = 1;
    };

    G1CP_LogReplaceEntry(topicName, G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_CorrectedStr, 
        G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_OrginialStr);
    return TRUE;
};
