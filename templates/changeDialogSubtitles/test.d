/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("### TODO Output unit name ###");
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), "### TODO Corrected subtitles ###");
};
