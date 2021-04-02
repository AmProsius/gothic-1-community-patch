/*
 * #132 Spelling - Book: "Die Gruft" (DE)
 *
 * The description of the item "Die_Gruft" is inspected programmatically.
 *
 * Expected behavior: The book will have the correct description (checked for German localization only).
 */
func int G1CP_Test_132() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("Die_Gruft");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'Die_Gruft' not found");
        return FALSE;
    };

    // Create the book locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.description, "Die Gruft")) {
            return TRUE;
        } else {
            var string msg; msg = "Description incorrect: description = '";
            msg = ConcatStrings(msg, item.description);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'Die_Gruft' could not be created");
        return FALSE;
    };
};
