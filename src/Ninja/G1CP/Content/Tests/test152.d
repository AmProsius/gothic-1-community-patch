/*
 * #152 Spelling - Ring of Fire Protection (EN)
 *
 * The description of the item "Schutzring_Feuer2" is inspected programmatically.
 *
 * Expected behavior: The ring will have the correct description (checked for English localization only).
 */
func int G1CP_Test_152() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_EN) {
        G1CP_TestsuiteErrorDetail("Test applicable for English localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("Schutzring_Feuer2");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'Schutzring_Feuer2' not found");
        return FALSE;
    };

    // Create the ring locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.description, "Ring of Fire Protection")) {
            return TRUE;
        } else {
            var string msg; msg = "Description incorrect: description = '";
            msg = ConcatStrings(msg, item.description);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'Schutzring_Feuer2' could not be created");
        return FALSE;
    };
};
