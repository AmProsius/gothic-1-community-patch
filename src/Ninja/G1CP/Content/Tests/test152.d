/*
 * #152 Spelling - Ring of Fire Protection (EN)
 */
func int G1CP_Test_152() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("Schutzring_Feuer2");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemVariable(itm, "description", "Ring of Fire Protection");
};
