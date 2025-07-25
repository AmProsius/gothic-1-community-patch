/*
 * #60 Jesse's quest not available
 */
func int G1CP_0060_JesseQuest() {
    var int applied; applied = FALSE;

    // Find all necessary symbols
    var int funcId; funcId = G1CP_GetFuncId("DIA_Jesse_Mission_Condition", "int|none");
    var int cond1Id; cond1Id = G1CP_GetInfoInstId("DIA_Jesse_Mission");
    var int cond2Id; cond2Id = G1CP_GetInfoInstId("DIA_Jesse_Warn");
    if (funcId == -1) || (cond1Id == -1) || (cond2Id == -1) {
        return FALSE;
    };

    // Find "if (Npc_KnowsInfo(xxxx, DIA_Jesse_Mission)) { ... "
    var int bytes[3]; // 11 bytes used
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, cond1Id);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, MEM_GetFuncId(Npc_KnowsInfo));
    MEMINT_OFTok(zPAR_TOK_JUMPF);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 11);

    // There should only be one occurrence, otherwise no chance to identify the correct position in the function
    if (MEM_ArraySize(matches) == 1) {
        // Replace DIA_Jesse_Mission with DIA_Jesse_Warn
        MEMINT_OverrideFunc_Ptr = MEM_ArrayRead(matches, 0);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, cond2Id);

        // Success
        applied = TRUE;
    };

    // Free array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};
