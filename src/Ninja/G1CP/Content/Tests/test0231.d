/*
 * #231 Spelling - Transform Orc Dog (DE)
 */
func void G1CP_Test_0231() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItArScrollTrfOrcdog");
    G1CP_Testsuite_AssertS(itm.description, "Verwandlung Orkhund");
};
