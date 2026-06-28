/*
 * #270 Spelling - Key to the main door of the storage rooms in the cellar of the ore barons (DE)
 */
func int G1CP_Test_0270() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");

    return G1CP_Testsuite_InspectItemString(itm, "### TODO Class variable, e.g. text[0] ###", "### TODO Expected string ###");
};
