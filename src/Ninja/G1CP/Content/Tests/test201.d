/*
 * #201 Text of Ancient Ore Armor too long (DE)
 *
 * The text of the item "ORE_ARMOR_M" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct text (checked for German localization only).
 */
func int G1CP_Test_201() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_M");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ORE_ARMOR_M' not found");
        return FALSE;
    };

    // Create the armor locally
    if (Itm_GetPtr(symbId)) {
        // Static string arrays cannot be read directly
        var string item_text_0; item_text_0 = MEM_ReadStatStringArr(item.text, 0);

        if (Hlp_StrCmp(item_text_0, "Diese alte Rüstung wurde aus magischem Erz gefertigt.")) {
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: text[0] = '";
            msg = ConcatStrings(msg, item_text_0);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ORE_ARMOR_M' could not be created");
        return FALSE;
    };
};
