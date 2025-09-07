/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string symbolName = "### TODO: Symbol name ###";
    const string correctedString = "### TODO: Corrected string ###";
    var int symbId; symbId = G1CP_Testsuite_CheckStringConst(symbolName, 0);

    var string currentString; currentString = G1CP_GetStringConstI(symbId, correctedString, "G1CP invalid string");
    if (STR_Compare(currentString) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetail3("String constant incorrect: '", currentString, "'");
        return FALSE;
    };

    return TRUE;
};
