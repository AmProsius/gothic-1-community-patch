/*
 * #268 Spelling - Text of key of the laboratory chest (DE)
 */
func void G1CP_Test_0268() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Tpl_TestItemStringVar("ITKE_PSI_KALOM_01", "text[0]", "Öffnet die Truhe im Alchemielabor");
    G1CP_Tpl_TestItemStringVar("ITKE_PSI_KALOM_01", "text[1]", "des Sumpflagers.");
};
