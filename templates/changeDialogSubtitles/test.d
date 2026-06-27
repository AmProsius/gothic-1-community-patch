/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("### TODO Output unit name ###");
    return G1CP_Testsuite_InspectOuString(ouPtr, "text", "### TODO Corrected subtitles ###");
};
