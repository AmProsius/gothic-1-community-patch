/*
 * #344 Spelling - There are quotation marks in Ian's subtitles (EN)
 */
func int G1CP_Test_0344() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("### TODO Output unit name ###");
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), "### TODO Corrected subtitles ###");
};
