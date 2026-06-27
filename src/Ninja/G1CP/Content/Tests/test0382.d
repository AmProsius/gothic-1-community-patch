/*
 * #382 Spelling - There are quotation marks in Lester's subtitles (EN)
 */
func int G1CP_Test_0382() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("PC_Psionic_SMITH_Info_05_01");
    G1CP_Testsuite_AssertS(
        G1CP_GetOuTextP(ouPtr),
        "That's the smithy! Have a look around; I'll wait here for about an hour, then I'll leave."
    );
};
