/*
 * #341 Spelling - There are quotation marks in the subtitles of the welcome dialog with Cor Calom (EN)
 */
func void G1CP_Test_0341() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    G1CP_Tpl_TestOuText("GUR_1201_CorKalom_JoinPSI_15_10", "That was it? No welcome, no nothing?");
};
