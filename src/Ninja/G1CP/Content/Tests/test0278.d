/*
 * #278 Female SVM subtitles don't match the audio (EN)
 */
func void G1CP_Test_0278() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("SVM_16_NotNow");
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), "Shh, you're not allowed to talk to us.");
};
