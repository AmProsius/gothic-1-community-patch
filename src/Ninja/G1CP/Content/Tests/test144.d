/*
 * #174 Spelling - Gomez' Armor (DE)
 *
 * The name of the item "EBR_ARMOR_H" is inspected programmatically.
 *
 * Expected behavior: The armor will have the correct name (checked for German localization only).
 */
func int G1CP_Test_144() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("EBR_ARMOR_H");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'EBR_ARMOR_H' not found");
        return FALSE;
    };

    // Create the armor locally
    if (Itm_GetPtr(symbId)) {
        if (Hlp_StrCmp(item.name, "Gomez' R�stung")) {
            return TRUE;
        } else {
            var string msg; msg = "Name incorrect: name = '";
            msg = ConcatStrings(msg, item.name);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'EBR_ARMOR_H' could not be created");
        return FALSE;
    };
};
