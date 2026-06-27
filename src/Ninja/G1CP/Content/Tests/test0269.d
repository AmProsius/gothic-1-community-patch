/*
 * #269 Spelling - Sunken Tower' Key Text (DE/EN)
 *
 * The text of the item "ItKe_SunkenTower" is inspected programmatically.
 *
 * Expected behavior: The key's text will have the correct capitalization
 * (checked for English and German localization only).
 */
func void G1CP_Test_0269() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("ItKe_SunkenTower");

    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Testsuite_AssertS(itm.text, "Opens the chests in the");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Testsuite_AssertS(itm.text, "Öffnet die Truhen");
    };
};
