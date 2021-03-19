/*
 * #49 Dungeon Key description faulty
 */
func int G1CP_049_DungeonKeyText() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_GetSymbolIndex("DungeonKey");
    var int itemTextSymbId; itemTextSymbId = MEM_GetSymbolIndex("C_ITEM.TEXT");
    if (symbId == -1) || (itemTextSymbId == -1) {
        return FALSE;
    };

    // Find "text = xxx" in the instance function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_TOK_ASSIGNSTR};
    bytes[1] = itemTextSymbId;
    var int matches; matches = G1CP_FindInFunc(symbId, _@(bytes)+3, 6);

    // We are looking for all overwritten text (at least 2 occurrences)
    if (MEM_ArraySize(matches) >= 2) {

        // Iterate over all matches
        repeat(i, MEM_ArraySize(matches)); var int i; if (!i) { i = 1; }; // Skip the first occurrence

            // Write the correct byte code at a new address: "text[i] = xxxx"
            var int ptr; ptr = MEM_Alloc(7);
            MEMINT_OverrideFunc_Ptr = ptr;
            MEMINT_OFTokPar(zPAR_TOK_PUSH_ARRAYVAR, itemTextSymbId); MEMINT_OFTok(i);
            MEMINT_OFTok(zPAR_TOK_RET);

            // Overwrite "text = xxx" with a call to the above bytes
            MEMINT_OverrideFunc_Ptr = MEM_ArrayRead(matches, i);
            MEMINT_OFTokPar(zPAR_TOK_CALL, ptr - currParserStackAddress);

            applied += 1;
        end;
    };

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
