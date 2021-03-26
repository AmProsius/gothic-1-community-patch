/*
 * #173 Spelling - Gomez' Key: "Gomez' Truhen" (DE)
 *
 * The text of the item "ItKe_Gomez_01" is inspected programmatically.
 *
 * Expected behavior: The key will have the correct text (checked for German localization only).
 */
func int G1CP_Test_173() {
    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("ItKe_Gomez_01");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItKe_Gomez_01' not found");
        return FALSE;
    };

    // Create the key locally
    if (Itm_GetPtr(symbId)) {
        // Static string arrays cannot be read directly
        var string item_text_0; item_text_0 = MEM_ReadStatStringArr(item.text, 0);

        if (Hlp_StrCmp(item_text_0, "�ffnet Gomez' Truhen")) {
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: text[0] = '";
            msg = ConcatStrings(msg, item_text_0);
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ItKe_Gomez_01' could not be created");
        return FALSE;
    };
};
