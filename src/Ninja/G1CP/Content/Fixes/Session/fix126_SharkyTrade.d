/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 */
func int Ninja_G1CP_126_SharkyTrade() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("Org_843_Sharky_Fisk");
    var int infoPermSymbId; infoPermSymbId = MEM_FindParserSymbol("C_Info.trade");
    if (symbId == -1) || (infoPermSymbId == -1) {
        return FALSE;
    };

    // Find "trade = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, 0, zPAR_OP_IS};
    bytes[1] = infoPermSymbId;
    var int matches; matches = Ninja_G1CP_FindInFunc(symbId, _@(bytes)+3, 6);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check context: "trade = 1" or "trade = symbol containing 1"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (varId <= 0) || (varId >= currSymbolTableLength) {
                continue;
            };
            var int varSymbPtr; varSymbPtr = MEM_GetSymbolByIndex(varId);
            if (!varSymbPtr) {
                continue;
            };
            if (MEM_ReadInt(varSymbPtr + zCParSymbol_content_offset) != 1) {
                continue;
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            if (MEM_ReadInt(pos-4) != 1) {
                continue;
            };
        } else {
            continue;
        };

        // Overwrite "trade = 1" with "trade = 0"
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 0);

        applied += 1;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
