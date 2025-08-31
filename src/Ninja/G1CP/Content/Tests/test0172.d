/*
 * #172 Spelling - Kalom's Recipe (DE)
 */
func void G1CP_Test_0172() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("KalomsRecipe");
    G1CP_Testsuite_AssertS(itm.name, "Kaloms Rezept");
};
