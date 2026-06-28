/*
 * #343 Spelling - "The armor plate of a minecrawler warrior" (EN).
 */
func int G1CP_Test_0343() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");

    return G1CP_Testsuite_InspectItemString(itm, "description", "### TODO Expected string ###");
};
