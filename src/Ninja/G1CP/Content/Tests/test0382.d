/*
 * #382 Spelling - There are quotation marks in Lester's subtitles (EN)
 */
func int G1CP_Test_0382() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("### TODO Output unit name ###");
    return G1CP_Testsuite_InspectOuString(ouPtr, "text", "### TODO Corrected subtitles ###");
};
