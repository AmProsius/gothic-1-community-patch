/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string targetName = "### TODO: The target's name ###";
    const string arrayName = "### TODO: Array name ###";
    const string correctedString = "### TODO: Corrected string ###";
    const int targetInt = 0; targetInt = G1CP_Testsuite_GetIntConst(targetName, 0);
    var string name; name = G1CP_Testsuite_GetStringConst(arrayName, targetInt);

    if (!Hlp_StrCmp(name, correctedString)) {
        G1CP_TestsuiteErrorDetailSSSSSSS("String incorrect: ", arrayName, "[", targetName, "] = '", name, "'");
        return FALSE;
    };

    return TRUE;
};
