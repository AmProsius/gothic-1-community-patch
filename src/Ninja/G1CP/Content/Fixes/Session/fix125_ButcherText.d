/*
 * #125 The Butcher is described as two-handed sword
 */
func int G1CP_125_ButcherText() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("ItMw_1H_Sword_Bastard_02");
    var int itemTextSymbId; itemTextSymbId = MEM_FindParserSymbol("C_ITEM.TEXT");
    var int oneHandedSymbId; oneHandedSymbId = MEM_FindParserSymbol("NAME_OneHanded");
    var int twoHandedSymbId; twoHandedSymbId = MEM_FindParserSymbol("NAME_TwoHanded");
    if (symbId == -1) || (itemTextSymbId == -1) || (oneHandedSymbId == -1) || (twoHandedSymbId == -1) {
        return FALSE;
    };

    // Read string content
    const string NAME_TwoHanded = ""; // Must be a constant
    NAME_TwoHanded = G1CP_GetStringVarByIndex(twoHandedSymbId, 0, "G1CP_invalid_string");

    // Find "text[4] = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSH_ARRAYVAR<<24, -1, 4 + (zPAR_TOK_ASSIGNSTR<<8)};
    bytes[1] = itemTextSymbId;
    var int matches; matches = G1CP_FindInFunc(symbId, _@(bytes)+3, 7);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check context: "text[4] = NAME_TwoHanded"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (Hlp_StrCmp(G1CP_GetStringVarByIndex(varId, 0, ""), NAME_TwoHanded)) {

                // Overwrite "text[4] = NAME_TwoHanded" with "text[4] = NAME_OneHanded"
                MEMINT_OverrideFunc_Ptr = pos-5;
                MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, oneHandedSymbId);

                applied += 1;
            };
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
