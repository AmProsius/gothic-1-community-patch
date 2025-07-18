/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string symbolName = "### TODO: Symbol name ###";
    const string originalString = "### TODO: Original string ###";
    const string correctedString = "### TODO: Corrected string ###";
    var string currentString; currentString = G1CP_GetStringConst(symbolName, 0, "G1CP invalid string");

    if (!Hlp_StrCmp(currentString, originalString)) {
        return FALSE;
    };

    G1CP_SetStringConst(symbolName, 0, correctedString);
    G1CP_LogRenameTopic(currentString, correctedString);
};

/*
 * This function reverts the changes of #{ISSUE_NUM}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    const string symbolName = "### TODO: Symbol name ###";
    const string originalString = "### TODO: Original string ###";
    const string correctedString = "### TODO: Corrected string ###";
    var string currentString; currentString = G1CP_GetStringConst(symbolName, 0, "G1CP invalid string");

    if (!Hlp_StrCmp(currentString, correctedString)) {
        return FALSE;
    };

    G1CP_SetStringConst(symbolName, 0, originalString);
    G1CP_LogRenameTopic(currentString, originalString);
};
