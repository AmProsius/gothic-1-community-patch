/*
 * #338 Spelling - Grilled Meat (DE/EN)
 */
func int G1CP_Test_0338() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE | G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");

    return G1CP_Testsuite_InspectItemString(itm, "name", "### TODO Expected string ###");
};
