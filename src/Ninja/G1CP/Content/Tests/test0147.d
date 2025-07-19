/*
 * #147 Spelling - Crawler Plate Armor (DE)
 */
func int G1CP_Test_0147() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("CRW_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "name", "Crawlerplatten-Rüstung");
};
