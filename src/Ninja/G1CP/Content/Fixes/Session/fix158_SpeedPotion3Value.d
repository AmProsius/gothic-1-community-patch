/*
 * #158 Potion of Haste has wrong ore value
 */
func int Ninja_G1CP_158_SpeedPotion3Value() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("ItFo_Potion_Haste_03");
    var int itemValueSymbId; itemValueSymbId = MEM_FindParserSymbol("C_ITEM.value");
    var int value1SymbId; value1SymbId = MEM_FindParserSymbol("Value_Haste1");
    var int value1SymbPtr; value1SymbPtr = MEM_GetSymbol("Value_Haste1");
    var int value3SymbPtr; value3SymbPtr = MEM_GetSymbol("Value_Haste3");
    if (symbId == -1) || (itemValueSymbId == -1) || (!value3SymbPtr) { // Only those three are strictly required
        return FALSE;
    };

    // Get content of potion values
    var int Value_Haste3; Value_Haste3 = MEM_ReadInt(value3SymbPtr + zCParSymbol_content_offset);
    var int Value_Haste1;
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

    // Find "value = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, 0, zPAR_OP_IS};
    bytes[1] = itemValueSymbId;
    var int matches; matches = Ninja_G1CP_FindInFunc(symbId, _@(bytes)+3, 6);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check context: "value = Value_Haste1" (literal) or "value = symbol equal to Value_Haste1"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (varId != value1SymbId) {
                if (varId <= 0) || (varId >= currSymbolTableLength) {
                    continue;
                };
                var int varSymbPtr; varSymbPtr = MEM_GetSymbolByIndex(varId);
                if (!varSymbPtr) {
                    continue;
                };
                if (MEM_ReadInt(varSymbPtr + zCParSymbol_content_offset) != Value_Haste1) {
                    continue;
                };
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            if (MEM_ReadInt(pos-4) != Value_Haste1) {
                continue;
            };
        } else {
            continue;
        };

        // Overwrite "value = Value_Haste1" with "value = Value_Haste3" (literal)
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, Value_Haste3);

        applied += 1;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
