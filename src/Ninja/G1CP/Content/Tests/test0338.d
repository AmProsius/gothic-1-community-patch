/*
 * #338 Spelling - Grilled Meat (DE/EN)
 */
func void G1CP_Test_0338() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE | G1CP_Lang_EN);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("ItFoMutton", "name", "Grilled Meat");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("ItFoMutton", "name", "Gebratenes Fleisch");
    };
};
