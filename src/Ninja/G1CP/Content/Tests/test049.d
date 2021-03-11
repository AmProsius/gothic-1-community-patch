/*
 * #49 Dungeon Key description faulty
 *
 * The text of the item "DungeonKey" is inspected programmatically
 *
 * Expected behavior: The key will have the correct description (checked for English and German localization only)
 */
func int G1CP_Test_049() {
    // Check language first
    if (G1CP_Lang != 0) && (G1CP_Lang != 1) {
        G1CP_TestsuiteErrorDetail("Test applicable for English and German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_FindParserSymbol("DungeonKey");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'DungeonKey' not found");
        return FALSE;
    };

    // Create the key locally
    if (Itm_GetPtr(symbId)) {
        // Static string arrays cannot be read directly
        var string item_text_1; item_text_1 = MEM_ReadStatStringArr(item.text, 1);

        if ((Hlp_StrCmp(item.text, "Opens the dungeons")) && (Hlp_StrCmp(item_text_1, "of the old camp.")))    // EN
        || ((Hlp_StrCmp(item.text, "öffnet den Kerker"))  && (Hlp_StrCmp(item_text_1, "des Alten Lagers."))) { // DE
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: text[0] = '";
            msg = ConcatStrings(msg, item.text);
            msg = ConcatStrings(msg, "' and text[1] = '");
            msg = ConcatStrings(msg, item_text_1);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'DungeonKey' could not be created");
        return FALSE;
    };
};
