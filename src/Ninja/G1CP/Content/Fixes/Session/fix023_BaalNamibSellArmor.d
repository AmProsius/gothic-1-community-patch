/*
 * #23 Baal Namib sells Novice's Armor too late
 */
func int G1CP_023_BaalNamibSellArmor() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId;  funcId = MEM_GetSymbolIndex("GUR_1204_BaalNamib_ARMOR_Info");
    var int chptrId; chptrId = MEM_GetSymbolIndex("Kapitel");
    if (funcId == -1) || (chptrId == -1) {
        return FALSE;
    };

    // Find byte code in dialog function corresponding to: if (Kapitel < 3)
    const int bytes[3] = {0, 0, 0}; // 12 bytes used
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 3);
    MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, chptrId);
    MEMINT_OFTok(zPAR_OP_LOWER);
    MEMINT_OFTok(zPAR_TOK_JUMPF);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 12);

    // There should only be one occurrence, otherwise no chance to identify the correct position in the function
    if (MEM_ArraySize(matches) == 1) {
        var int pos; pos = MEM_ArrayRead(matches, 0)+1; // Just before "3"
        MEM_WriteInt(pos, 2);
        applied = TRUE;
    };

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};
