/*
 * #49 Dungeon Key description faulty
 */
func int Ninja_G1CP_049_DungeonKeyText() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int symbId; symbId = MEM_FindParserSymbol("DungeonKey");
    var int itemTextSymbId; itemTextSymbId = MEM_FindParserSymbol("C_ITEM.TEXT");
    if (symbId == -1) || (itemTextSymbId == -1) {
        return FALSE;
    };

    // Find "text = xxx" in the instance function
    var int s; s = SB_New();
    SBc(zPAR_TOK_PUSHVAR);   SBw(itemTextSymbId);
    SBc(zPAR_TOK_ASSIGNSTR);
    var int matches; matches = Ninja_G1CP_FindInFunc(symbId, SB_GetStream(), SB_Length());
    SB_Destroy();

    // We are looking for all overwritten text (at least 2 occurrences)
    if (MEM_ArraySize(matches) >= 2) {

        // Iterate over all matches
        repeat(i, MEM_ArraySize(matches)); var int i; if (!i) { i = 1; }; // Skip the first occurrence

            // Write the correct byte code at a new address: "text[i] = xxxx"
            s = SB_New();
            SBc(zPAR_TOK_PUSH_ARRAYVAR); SBw(itemTextSymbId); SBc(i);
            SBc(zPAR_TOK_RET);
            var int ptr; ptr = SB_GetStream();
            SB_Release();

            // Overwrite "text = xxx" with a call to the above bytes
            var int pos; pos = MEM_ArrayRead(matches, i);
            MEM_WriteByte(pos, zPAR_TOK_CALL);
            MEM_WriteInt(pos+1, ptr - currParserStackAddress);

            applied += 1;
        end;
    };

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
