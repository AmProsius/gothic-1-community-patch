/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 *
 * The name of the item "ORE_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for English and German localization only).
 */
func void G1CP_Test_0149() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ORE_ARMOR_H");

    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Testsuite_AssertS(itm.name, "Improved Ore Armor");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Testsuite_AssertS(itm.name, "Verbesserte Erzrüstung");
    };
};
