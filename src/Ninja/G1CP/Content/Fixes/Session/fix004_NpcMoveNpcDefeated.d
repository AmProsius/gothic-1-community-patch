/*
 * #4 NPCs are rude to the player even after defeating them
 */
func int G1CP_004_NpcMoveNpcDefeated() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = MEM_GetSymbolIndex("B_MoveNpc");
    var int npcAIVarId; npcAIVarId = MEM_GetSymbolIndex("C_Npc.aivar");
    var int aivId; aivId = MEM_GetSymbolIndex("AIV_WasDefeatedBySC");
    if (funcId == -1) || (npcAIVarId == -1) || (aivId == -1) {
        return FALSE;
    };

    // Recreate the very specific list of if-conditions to find the position just before the if-block
    const int bytes[3] = {0, 0, 0}; // 11 bytes used
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
        var int pos; pos = MEM_ArrayRead(matches, 0)+10; // Just before zPAR_TOK_JUMPF
        var int targetFalse; targetFalse = MEM_ReadInt(pos+1);           // Offset after the if-block (FALSE)
        var int targetTrue; targetTrue = pos+5 - currParserStackAddress; // Offset inside the if-block (TRUE)

        // Create new byte code to check "(!self.aivar[AIV_WasDefeatedBySC])"
        const int detour = 0; detour = MEM_Alloc(23);
        MEMINT_OverrideFunc_Ptr = detour;
        MEMINT_OFTokPar(zPAR_TOK_SETINSTANCE, self);
        MEMINT_OFTokPar(zPAR_TOK_PUSH_ARRAYVAR, npcAIVarId); MEMINT_OFTok(G1CP_GetIntVarByIndex(aivId, 0, 19));
        MEMINT_OFTok(zPAR_OP_UN_NOT);
        MEMINT_OFTok(zPAR_OP_LOG_AND);
        MEMINT_OFTokPar(zPAR_TOK_JUMPF, targetFalse);
        MEMINT_OFTokPar(zPAR_TOK_JUMP, targetTrue);

        // Overwrite the jump to detour to our additional condition
        MEMINT_OverrideFunc_Ptr = pos;
        MEMINT_OFTokPar(zPAR_TOK_JUMP, detour - currParserStackAddress);

        // Success
        applied = TRUE;
    };

    // Free array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};
