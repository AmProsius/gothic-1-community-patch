/*
 * #200 Text of Improved Ore Armor too long (DE)
 */
func void G1CP_Test_0200() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Tpl_TestItemStringVar("ORE_ARMOR_H", "text", "Stone der Schmied hat sie noch verbessern können!");
};
