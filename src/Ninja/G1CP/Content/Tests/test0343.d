/*
 * #343 Spelling - "The armor plate of a minecrawler warrior" (EN).
 */
func void G1CP_Test_0343() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    G1CP_Tpl_TestItemStringVar("ItAt_Crawler_02", "description", "The Armor Plate of a Minecrawler Warrior");
};
