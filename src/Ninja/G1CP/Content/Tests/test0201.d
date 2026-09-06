/*
 * #201 Text of Ancient Ore Armor too long (DE)
 */
func void G1CP_Test_0201() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Tpl_TestItemStringVar("ORE_ARMOR_M", "text", "Diese alte Rüstung wurde aus magischem Erz gefertigt.");
};
