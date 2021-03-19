/*
 * #158 Potion of Haste has wrong ore value
 */
func int G1CP_158_SpeedPotion3Value() {
    // Get content of potion values
    var int Value_Haste1;
    var int Value_Haste3;

    var int value1SymbPtr; value1SymbPtr = MEM_GetSymbol("Value_Haste1");
    var int value3SymbPtr; value3SymbPtr = MEM_GetSymbol("Value_Haste3");
    if (value3SymbPtr) {
        // Find value from constant
        Value_Haste3 = MEM_ReadInt(value3SymbPtr + zCParSymbol_content_offset);
    } else {
        // This one is strictly required
        return FALSE;
    };
    if (value1SymbPtr) {
        // Find value from constant
        Value_Haste1 = MEM_ReadInt(value1SymbPtr + zCParSymbol_content_offset);
    } else if (Itm_GetPtr(MEM_GetSymbolIndex("ItFo_Potion_Haste_01"))) {
        // If not found, determine from level one speed potion
        Value_Haste1 = item.value;
    } else {
        // If neither is found, we cannot compare and be sure that the potion values are not intended
        return FALSE;
    };

    // Replace any assignments to value
    var int symbId; symbId = MEM_GetSymbolIndex("ItFo_Potion_Haste_03");
    return (G1CP_ReplaceAssignInt(symbId, "C_ITEM.value", 0, Value_Haste1, Value_Haste3) > 0);
};
