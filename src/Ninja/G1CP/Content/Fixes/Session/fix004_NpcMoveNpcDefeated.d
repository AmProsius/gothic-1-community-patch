/*
 * #4 NPCs are rude to the player even after defeating them
 */
func int G1CP_004_NpcMoveNpcDefeated() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = MEM_GetSymbolIndex("B_MoveNpc");
    if (funcId == -1) || (MEM_GetSymbolIndex("AIV_WasDefeatedBySC") == -1) {
        return FALSE;
    };

    // Recreate the very specific list of if-conditions to find the position just before the if-block
    var int bytes[3]; // 11 bytes used
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, MEM_GetFuncID(Npc_GetAttitude));
    MEMINT_OFTok(zPAR_OP_EQUAL);
    MEMINT_OFTok(zPAR_OP_LOG_OR);
    MEMINT_OFTok(zPAR_OP_LOG_AND);
    MEMINT_OFTok(zPAR_OP_LOG_AND);
    MEMINT_OFTok(zPAR_OP_LOG_AND);
    MEMINT_OFTok(zPAR_TOK_JUMPF);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 11);

    // There should only be one occurrence, otherwise no chance to identify the correct position in the function
    if (MEM_ArraySize(matches) == 1) {
        // Add another condition to the if-statement
        var int pos; pos = MEM_ArrayRead(matches, 0)+10; // Just before zPAR_TOK_JUMPF
        G1CP_AddIfCondition(pos, zPAR_OP_LOG_AND, G1CP_004_NpcMoveNpcDefeated_Condition);

        // Success
        applied = TRUE;
    };

    // Free array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * Additional condition
 */
func int G1CP_004_NpcMoveNpcDefeated_Condition() {
    G1CP_ReportFuncToSpy();

    // (!self.aivar[AIV_WasDefeatedBySC])
    return (!G1CP_GetAIVar(self, "AIV_WasDefeatedBySC", 0)); // Symbol exists as established by the function above
};
