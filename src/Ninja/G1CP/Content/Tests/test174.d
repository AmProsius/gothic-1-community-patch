/*
 * #174 Spelling - Gomez' Key (EN)
 */
func int G1CP_Test_174() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_Gomez_01");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemVariable(itm, "name", "Gomez' Key");
};
