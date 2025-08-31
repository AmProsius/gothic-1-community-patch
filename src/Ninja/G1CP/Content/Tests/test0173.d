/*
 * #173 Spelling - Gomez' Key: "Gomez' Truhen" (DE)
 */
func void G1CP_Test_0173() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Gomez_01");
    G1CP_Testsuite_AssertS(itm.text, "Öffnet Gomez' Truhen");
};
