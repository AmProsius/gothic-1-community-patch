/*
 * #172 Spelling - Kalom's Recipe (DE)
 */
func int G1CP_Test_172() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("KalomsRecipe");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "name", "Kaloms Rezept");
};
