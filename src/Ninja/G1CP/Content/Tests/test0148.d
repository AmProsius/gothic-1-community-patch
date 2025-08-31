/*
 * #148 Spelling - Ancient Ore Armor (DE)
 */
func void G1CP_Test_0148() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_M");
    G1CP_Testsuite_AssertS(itm.name, "Antike Erzrüstung");
};
