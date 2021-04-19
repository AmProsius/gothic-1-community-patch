/*
 * #49 Dungeon Key description faulty
 *
 * The text of the item "DungeonKey" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct description (checked for English and German localization only).
 */
func int G1CP_Test_049() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN|G1CP_Lang_DE);
    var C_Item item; item = G1CP_Testsuite_CreateItem("DungeonKey");
    G1CP_Testsuite_CheckPassed();

    // Static string arrays cannot be read directly
    var string item_text_1; item_text_1 = MEM_ReadStatStringArr(item.text, 1);

    if ((Hlp_StrCmp(item.text, "Opens the dungeons")) && (Hlp_StrCmp(item_text_1, "of the old camp.")))    // EN
    || ((Hlp_StrCmp(item.text, "öffnet den Kerker"))  && (Hlp_StrCmp(item_text_1, "des Alten Lagers."))) { // DE
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSSSS("Text incorrect: text[0] = '", item.text, "' and text[1] = '", item_text_1, "'");
        return FALSE;
    };
};
