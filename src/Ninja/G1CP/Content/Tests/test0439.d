/*
 * #439 Spelling - Raw Meat (DE)
 */
func void G1CP_Test_0439() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFoMuttonRaw");
    G1CP_Testsuite_AssertS(itm.name, "Rohes Fleisch");
};
