/*
 * #125 The Butcher is described as two-handed sword
 *
 * The text of the item "ItMw_1H_Sword_Bastard_02" is inspected programmatically.
 *
 * Expected behavior: The sword will have the correct text (checked for English and German localization only).
 */
func void G1CP_Test_0125() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("ItMw_1H_Sword_Bastard_02", "text[4]", "One-handed Weapon");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("ItMw_1H_Sword_Bastard_02", "text[4]", "Einhandwaffe");
    };
};
