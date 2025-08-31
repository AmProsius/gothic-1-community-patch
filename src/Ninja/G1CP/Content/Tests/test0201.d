/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func void G1CP_Test_0201() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_AssertS(itm.text, "Diese alte Rüstung wurde aus magischem Erz gefertigt.");
};
