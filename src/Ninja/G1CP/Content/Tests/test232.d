/*
 * #232 Spelling - Transform Bloodfly (DE)
 */
func int G1CP_Test_232() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItArScrollTrfBloodfly");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "description", "Verwandlung Blutfliege");
};
