/*
 * #175 Spelling - Rice Lord's Key (EN)
 */
func int G1CP_Test_0175() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKey_RB_01");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "name", "Rice Lord's Key");
};
