/*
 * #49 Dungeon Key description faulty
 *
 * The text of the item "DungeonKey" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct description (checked for English and German localization only).
 */
func int G1CP_Test_0049() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN | G1CP_Lang_DE);
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("DungeonKey");
    G1CP_Testsuite_CheckPassed();

    // Static string arrays cannot be read directly
    var string itm_text_1; itm_text_1 = MEM_ReadStatStringArr(itm.text, 1);

    if ((Hlp_StrCmp(itm.text, "Opens the dungeons")) && (Hlp_StrCmp(itm_text_1, "of the old camp.")))    // EN
    || ((Hlp_StrCmp(itm.text, "öffnet den Kerker"))  && (Hlp_StrCmp(itm_text_1, "des Alten Lagers."))) { // DE
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetailSSSSS("Text incorrect: text[0] = '", itm.text, "' and text[1] = '", itm_text_1, "'");
        return FALSE;
    };
};
