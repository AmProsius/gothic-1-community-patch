/*
 * #200 Text of Improved Ore Armor too long (DE)
 */
func int G1CP_Test_200() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemVariable(itm, "text[0]", "Stone der Schmied hat sie noch verbessern können!");
};
