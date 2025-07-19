/*
 * #231 Spelling - Transform Orc Dog (DE)
 */
func int G1CP_Test_0231() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItArScrollTrfOrcdog");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "description", "Verwandlung Orkhund");
};
