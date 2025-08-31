/*
 * #49 Dungeon Key description faulty
 *
 * The text of the item "DungeonKey" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct description (checked for English and German localization only).
 */
func void G1CP_Test_0049() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("DungeonKey");
    var string itm_text_1; itm_text_1 = MEM_ReadStatStringArr(itm.text, 1); // itm.text[1]

    if (G1CP_Lang & G1CP_Lang_EN) {
        G1CP_Testsuite_AssertS(itm.text, "Opens the dungeons");
        G1CP_Testsuite_AssertS(itm_text_1, "of the old camp.");
    } else if (G1CP_Lang & G1CP_Lang_DE) {
        G1CP_Testsuite_AssertS(itm.text, "öffnet den Kerker");
        G1CP_Testsuite_AssertS(itm_text_1, "des Alten Lagers.");
    };
};
