/*
 * #269 Spelling - Sunken Tower' Key Text (DE/EN)
 */
func void G1CP_Test_0269() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("ItKe_SunkenTower", "text", "Opens the chests in the");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("ItKe_SunkenTower", "text", "Öffnet die Truhen");
    };
};
