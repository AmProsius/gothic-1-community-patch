/*
 * #338 Spelling - Grilled Meat (DE/EN)
 */
func void G1CP_Test_0338() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE | G1CP_Lang_EN);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItFoMutton");

    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Testsuite_AssertS(itm.name, "Grilled Meat");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Testsuite_AssertS(itm.name, "Gebratenes Fleisch");
    };
};
