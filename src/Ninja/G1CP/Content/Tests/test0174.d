/*
 * #174 Spelling - Gomez' Key (EN)
 */
func void G1CP_Test_0174() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Gomez_01");
    G1CP_Testsuite_AssertS(itm.name, "Gomez' Key");
};
