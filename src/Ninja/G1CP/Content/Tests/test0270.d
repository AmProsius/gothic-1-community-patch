/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func int G1CP_Test_0270() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Storage_01");
    var string itm_text_1; itm_text_1 = MEM_ReadStatStringArr(itm.text, 1); // itm.text[1]

    G1CP_Testsuite_AssertS(itm.text, "Öffnet die Haupttür der Lager-");
    G1CP_Testsuite_AssertS(itm_text_1, "räume im Keller der Erzbarone.");
};
