/*
 * #146 Spelling - Novice's Loincloth (DE)
 */
func int G1CP_Test_0146() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("NOV_ARMOR_L");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "name", "Novizenrock");
};
