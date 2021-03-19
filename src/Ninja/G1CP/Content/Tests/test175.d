/*
 * #175 Spelling - Rice Lord's Key (EN)
 *
 * The name of the item "ItKey_RB_01" is inspected programmatically
 *
 * Expected behavior: The key will have the correct name (checked for English localization only)
 */
func int G1CP_Test_175() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_EN) {
        G1CP_TestsuiteErrorDetail("Test applicable for English localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("ItKey_RB_01");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItKey_RB_01' not found");
        return FALSE;
    };

    // Create the key locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.name, "Rice Lord's Key")) {
            return TRUE;
        } else {
            var string msg; msg = "Name incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ItKey_RB_01' could not be created");
        return FALSE;
    };
};
