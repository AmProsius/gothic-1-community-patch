/*
 * #144 Spelling - Gomez' Armor (DE)
 */
func void G1CP_Test_0144() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("EBR_ARMOR_H");
    G1CP_Testsuite_AssertS(itm.name, "Gomez' Rüstung");
};
