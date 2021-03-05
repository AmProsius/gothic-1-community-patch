/*
 * #30 Silas trades only one time
 */
func int Ninja_G1CP_030_SilasTrade() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("DIA_Silas_Trade");
    var int infoPermSymbId; infoPermSymbId = MEM_FindParserSymbol("C_Info.permanent");
    if (symbId == -1) || (infoPermSymbId == -1) {
        return FALSE;
    };

    // Find "permanent = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
    bytes[1] = infoPermSymbId;
    var int matches; matches = Ninja_G1CP_FindInFunc(symbId, _@(bytes)+3, 6);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check context: permanent = 0 or to symbol containing 0
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (varId <= 0) || (varId >= currSymbolTableLength) {
                continue;
            };
            var int varSymbPtr; varSymbPtr = MEM_GetSymbolByIndex(varId);
            if (!varSymbPtr) {
                continue;
            };
            if (MEM_ReadInt(varSymbPtr + zCParSymbol_content_offset) != 0) {
                continue;
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            if (MEM_ReadInt(pos-4) != 0) {
                continue;
            };
        } else {
            continue;
        };

        // Overwrite "permanent = 0" with "permanent = 1"
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);

        applied += 1;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
