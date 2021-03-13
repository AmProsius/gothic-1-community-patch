/*
 * #44 Bugmeat in the wrong inventory category
 */
func int G1CP_044_BugmeatCategory() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("ItAt_Meatbug_01");
    var int itemMainflagSymbId; itemMainflagSymbId = MEM_FindParserSymbol("C_ITEM.mainflag");
    if (symbId == -1) || (itemMainflagSymbId == -1) {
        return FALSE;
    };

    // Define possibly missing symbols locally
    const int ITEM_KAT_NONE = 1 << 0;
    const int ITEM_KAT_FOOD = 1 << 5;

    // Update ITEM_KAT_FOOD and ITEM_KAT_NONE if found (highly unlikely that they differ but let's be safe)
    ITEM_KAT_NONE = G1CP_GetIntVar("ITEM_KAT_NONE", 0, ITEM_KAT_NONE);
    ITEM_KAT_FOOD = G1CP_GetIntVar("ITEM_KAT_FOOD", 0, ITEM_KAT_FOOD);

    // Find "mainflag = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
    bytes[1] = itemMainflagSymbId;
    var int matches; matches = G1CP_FindInFunc(symbId, _@(bytes)+3, 6);

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check context: "mainflag = ITEM_KAT_NONE" (literal) or "mainflag = symbol equal to ITEM_KAT_NONE"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (varId <= 0) || (varId >= currSymbolTableLength) {
                continue;
            };
            var int varSymbPtr; varSymbPtr = MEM_GetSymbolByIndex(varId);
            if (!varSymbPtr) {
                continue;
            };
            if (MEM_ReadInt(varSymbPtr + zCParSymbol_content_offset) != ITEM_KAT_NONE) {
                continue;
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            if (MEM_ReadInt(pos-4) != ITEM_KAT_NONE) {
                continue;
            };
        } else {
            continue;
        };

        // Overwrite "mainflag = ITEM_KAT_NONE" with "mainflag = ITEM_KAT_FOOD" (literal)
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, ITEM_KAT_FOOD);

        applied += 1;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
