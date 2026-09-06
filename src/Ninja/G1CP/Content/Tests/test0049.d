/*
 * #49 Dungeon Key description faulty
 */
func void G1CP_Test_0049() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Tpl_TestItemStringVar("DungeonKey", "text[0]", "Opens the dungeons");
        G1CP_Tpl_TestItemStringVar("DungeonKey", "text[1]", "of the old camp.");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Tpl_TestItemStringVar("DungeonKey", "text[0]", "öffnet den Kerker");
        G1CP_Tpl_TestItemStringVar("DungeonKey", "text[1]", "des Alten Lagers.");
    };
};
