/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 */
func void G1CP_Test_0149() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("ORE_ARMOR_H", "name", "Improved Ore Armor");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("ORE_ARMOR_H", "name", "Verbesserte Erzrüstung");
    };
};
