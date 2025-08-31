/*
 * #147 Spelling - Crawler Plate Armor (DE)
 */
func void G1CP_Test_0147() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("CRW_ARMOR_H");
    G1CP_Testsuite_AssertS(itm.name, "Crawlerplatten-Rüstung");
};
