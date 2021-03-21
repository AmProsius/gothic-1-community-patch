/*
 * #158 Potion of Haste has wrong ore value
 *
 * The value of the item "ItFo_Potion_Haste_03" is inspected programmatically.
 *
 * Expected behavior: The item will have the correct value.
 */
func int G1CP_Test_158() {
    // Check if item exists
    var int symbId; symbId = MEM_GetSymbolIndex("ItFo_Potion_Haste_03");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItFo_Potion_Haste_03' not found");
        return FALSE;
    };

    // Check if variable exists
    var int symbPtr; symbPtr = MEM_GetSymbol("Value_Haste3");
    if (!symbPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Value_Haste3' not found");
        return FALSE;
    };
    var int Value_Haste3; Value_Haste3 = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // Create the potion locally
    if (Itm_GetPtr(symbId)) {
        if (item.value == Value_Haste3) {
            return TRUE;
        } else {
            var string msg; msg = "Category incorrect: value = '";
            msg = ConcatStrings(msg, IntToString(item.value));
            msg = ConcatStrings(msg, "'");
            G1CP_TestsuiteErrorDetail(msg);
            return FALSE;
        };
    } else {
        G1CP_TestsuiteErrorDetail("Item 'ItFo_Potion_Haste_03' could not be created");
        return FALSE;
    };
};
