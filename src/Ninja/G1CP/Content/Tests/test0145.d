/*
 * #145 Spelling - Light Mercenary's Armor (DE)
 */
func void G1CP_Test_0145() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("SLD_ARMOR_L");
    G1CP_Testsuite_AssertS(itm.name, "Leichte Söldnerrüstung");
};
