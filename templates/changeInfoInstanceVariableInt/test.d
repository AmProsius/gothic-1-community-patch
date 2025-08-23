/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    var oCInfo info; info = G1CP_Testsuite_FindInfo("### TODO Info instance name ###");
    G1CP_Testsuite_CheckPassed();

    // ### TODO Add early return and `G1CP_TestsuiteErrorDetail` for desired property ###

    return TRUE;
};
