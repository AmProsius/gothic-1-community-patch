/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func int G1CP_Test_0201() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "text[0]", "Diese alte Rüstung wurde aus magischem Erz gefertigt.");
};
