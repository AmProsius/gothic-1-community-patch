/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    // ### TODO: Replace OU name of "XXX_Ou" ###
    const string originalStr = "### TODO: Original string ###";
    const string correctedStr = "### TODO: Corrected string ###";

    return G1CP_ReplaceOuText("XXX_Ou", originalStr, correctedStr);
};
