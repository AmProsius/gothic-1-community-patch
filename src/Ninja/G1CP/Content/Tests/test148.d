/*
 * #148 Spelling - Ancient Ore Armor (DE)
 */
func int G1CP_Test_148() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemVariable(itm, "name", "Antike Erzr�stung");
};
