/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func void G1CP_Test_0270() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Tpl_TestItemStringVar("ItKe_Storage_01", "text[0]", "Öffnet die Haupttür der Lagerräume");
    G1CP_Tpl_TestItemStringVar("ItKe_Storage_01", "text[1]", "im Keller der Erzbarone.");
};
