/*
 * #343 Spelling - "The armor plate of a minecrawler warrior" (EN).
 */
func int G1CP_Test_0343() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItAt_Crawler_02");
    G1CP_Testsuite_AssertS(itm.description, "The Armor Plate of a Minecrawler Warrior");
};
