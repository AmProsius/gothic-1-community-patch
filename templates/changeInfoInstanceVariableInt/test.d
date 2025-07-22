/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    const string infoName = "### TODO: Info name ###";
    var oCInfo info; info = G1CP_Testsuite_FindInfo(infoName);
    G1CP_Testsuite_CheckPassed();

    // ### TODO: Add early return and `G1CP_TestsuiteErrorDetail` for desired property ###

    return TRUE;
};
