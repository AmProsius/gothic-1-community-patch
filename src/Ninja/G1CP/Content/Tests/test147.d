/*
 * #147 Spelling - Crawler Plate Armor (DE)
 *
 * The name of the item "CRW_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_147() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("CRW_ARMOR_H");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'CRW_ARMOR_H' not found");
        return FALSE;
    };

    // Create the armor locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.name, "Crawlerplatten-Rüstung")) {
            return TRUE;
        } else {
            var string msg; msg = "Name incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'CRW_ARMOR_H' could not be created");
        return FALSE;
    };
};
