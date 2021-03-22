/*
 * #148 Spelling - Ancient Ore Armor (DE)
 *
 * The name of the item "ORE_ARMOR_M" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_148() {
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
        if (Hlp_StrCmp(item.name, "Antike Erzrüstung")) {
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ORE_ARMOR_M' could not be created");
        return FALSE;
    };
};
