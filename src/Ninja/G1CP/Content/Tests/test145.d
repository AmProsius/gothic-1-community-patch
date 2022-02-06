/*
 * #145 Spelling - Light Mercenary's Armor (DE)
 */
func int G1CP_Test_145() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("SLD_ARMOR_L");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "name", "Leichte Söldnerrüstung");
};
