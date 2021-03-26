/*
 * #172 Spelling - Kalom's Recipe (DE)
 *
 * The name of the item "KalomsRecipe" is inspected programmatically.
 *
 * Expected behavior: The scroll will have the correct name (checked for German localization only).
 */
func int G1CP_Test_172() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("KalomsRecipe");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'KalomsRecipe' not found");
        return FALSE;
    };

    // Create the scroll locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.name, "Kaloms Rezept")) {
            return TRUE;
        } else {
            var string msg; msg = "Name incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'KalomsRecipe' could not be created");
        return FALSE;
    };
};
