/*
 * #439 Spelling - Raw Meat (DE)
 */
func int G1CP_Test_0439() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFoMuttonRaw");

    return G1CP_Testsuite_InspectItemString(itm, "name", "Rohes Fleisch");
};
