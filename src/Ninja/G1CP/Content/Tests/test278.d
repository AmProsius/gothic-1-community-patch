/*
 * #278 Female SVM subtitles don't match the audio (EN) (EN)
 */
func int G1CP_Test_278() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("SVM_16_NotNow");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectOuString(ouPtr, "text", "Shh, you're not allowed to talk to us.");
};
