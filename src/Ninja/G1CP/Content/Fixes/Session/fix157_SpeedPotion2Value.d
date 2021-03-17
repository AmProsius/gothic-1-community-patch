/*
 * #157 Potion of Velocity has wrong ore value
 */
func int G1CP_157_SpeedPotion2Value() {
    // Get content of potion values
    var int Value_Haste1;
    var int Value_Haste2;

    var int value1SymbPtr; value1SymbPtr = MEM_GetSymbol("Value_Haste1");
    var int value2SymbPtr; value2SymbPtr = MEM_GetSymbol("Value_Haste2");
    if (value2SymbPtr) {
        // Find value from constant
        Value_Haste2 = MEM_ReadInt(value2SymbPtr + zCParSymbol_content_offset);
    } else {
        // This one is strictly required
        return FALSE;
    };
    if (value1SymbPtr) {
        // Find value from constant
        Value_Haste1 = MEM_ReadInt(value1SymbPtr + zCParSymbol_content_offset);
    } else if (Itm_GetPtr(MEM_FindParserSymbol("ItFo_Potion_Haste_01"))) {
        // If not found, determine from level one speed potion
        Value_Haste1 = item.value;
    } else {
        // If neither is found, we cannot compare and be sure that the potion values are not intended
        return FALSE;
    };

    // Replace any assignments to value
    var int symbId; symbId = MEM_FindParserSymbol("ItFo_Potion_Haste_02");
    return (G1CP_ReplaceAssignInt(symbId, "C_ITEM.value", 0, Value_Haste1, Value_Haste2) > 0);
};
