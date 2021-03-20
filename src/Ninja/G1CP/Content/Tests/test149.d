/*
 * #149 Spelling - Improved Ore Armor (DE/EN)
 *
 * The text of the item "ORE_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct description (checked for English and German localization only).
 */
func int G1CP_Test_149() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_EN) && (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for English and German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("ORE_ARMOR_H");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ORE_ARMOR_H' not found");
        return FALSE;
    };

    // Create the armor locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.name, "Improved Ore Armor")) // EN
        || (Hlp_StrCmp(item.name, "Verbesserte Erzrüstung")) { // DE
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ORE_ARMOR_H' could not be created");
        return FALSE;
    };
};
