/*
 * #125 The Butcher is described as two-handed sword
 *
 * The text of the item "ItMw_1H_Sword_Bastard_02" is inspected programmatically
 *
 * Expected behavior: The sword will have the correct description (checked for English and German localization only)
 */
func int Ninja_G1CP_Test_125() {
    // Check language first
    if (Ninja_G1CP_Lang != 0) && (Ninja_G1CP_Lang != 1) {
        Ninja_G1CP_TestsuiteErrorDetail("Test applicable for English and German localization only");
        return TRUE; // True?
    };

    // Check if item exists
    var int symbId; symbId = MEM_FindParserSymbol("ItMw_1H_Sword_Bastard_02");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItMw_1H_Sword_Bastard_02' not found");
        return FALSE;
    };

    // Create the sword locally
    if (Itm_GetPtr(symbId)) {
        // Static string arrays cannot be read directly
        var string item_text_4; item_text_4 = MEM_ReadStatStringArr(item.text, 4);

        if (Hlp_StrCmp(item_text_4, "One-handed Weapon")) // EN
        || (Hlp_StrCmp(item_text_4, "Einhandwaffe")) {    // DE
            return TRUE;
        } else {
            var string msg; msg = "Text incorrect: text[4] = '";
            msg = ConcatStrings(msg, item_text_4);
            msg = ConcatStrings(msg, "'");
            Ninja_G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItMw_1H_Sword_Bastard_02' could not be created");
        return FALSE;
    };
};
