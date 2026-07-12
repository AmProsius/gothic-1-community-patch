/*
 * #341 Spelling - There are quotation marks in the subtitles of the welcome dialog with Cor Calom (EN)
 */
func int G1CP_Test_0341() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("GUR_1201_CorKalom_JoinPSI_15_10");
    G1CP_Testsuite_AssertS(G1CP_GetOuTextP(ouPtr), "That was it? No welcome, no nothing?");
};
