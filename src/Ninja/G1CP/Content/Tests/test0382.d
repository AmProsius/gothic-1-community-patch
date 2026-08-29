/*
 * #382 Spelling - There are quotation marks in Lester's subtitles (EN)
 */
func void G1CP_Test_0382() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    G1CP_Tpl_TestOuText(
        "PC_Psionic_SMITH_Info_05_01",
        "That's the smithy! Have a look around; I'll wait here for about an hour, then I'll leave."
    );
};
