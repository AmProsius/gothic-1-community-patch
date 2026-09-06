/*
 * #278 Female SVM subtitles don't match the audio (EN)
 */
func void G1CP_Test_0278() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    G1CP_Tpl_TestOuText("SVM_16_NotNow", "Shh, you're not allowed to talk to us.");
};
