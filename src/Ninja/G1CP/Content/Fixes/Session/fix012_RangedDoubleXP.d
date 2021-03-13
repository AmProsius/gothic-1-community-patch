/*
 * #12 Double exp when killing an NPC with a ranged weapon
 */
func int G1CP_012_RangedDoubleXP() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId;  funcId = MEM_FindParserSymbol("B_DeathXP");
    var int cond1Id; cond1Id = MEM_FindParserSymbol("ZS_Unconscious");
    var int cond3Id; cond3Id = MEM_FindParserSymbol("AIV_WASDEFEATEDBYSC");
    var int replOff; replOff = MEM_GetFuncOffset(G1CP_012_RangedDoubleXP_Condition);
    if (funcId == -1) || (cond1Id == -1) || (cond3Id == -1) {
        return FALSE;
    };

    // Byte code to search for (not using G1CP_ReplaceCallInFunc here because of extra checks below)
    const int bytes[4] = {zPAR_TOK_PUSHINT<<24, -1, zPAR_TOK_CALLEXTERN, -1};
    bytes[1] = cond1Id;
    MEM_WriteInt(_@(bytes)+9, MEM_GetFuncID(Npc_WasInState));
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 10);

    // Iterate over the matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Verify immediate context: Npc_WasInState(xxxx, ZS_Unconscious) without ! in front
        if (MEM_ReadByte(pos+10) != zPAR_OP_UN_NOT) {

            // Overwrite "Npc_WasInState" with "G1CP_012_RangedDoubleXP_Condition"
            MEMINT_OverrideFunc_Ptr = pos+5;
            MEMINT_OFTokPar(zPAR_TOK_CALL, replOff);

            // That's all
            applied += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};

/*
 * Intercepting function
 */
func int G1CP_012_RangedDoubleXP_Condition(var C_Npc slf, var int state) {
    G1CP_ReportFuncToSpy();

    // Original condition: Npc_WasInState(self, ZS_Unconscious)
    var int cond1;
    MEM_PushInstParam(slf);
    MEM_PushIntParam(state);
    MEM_Call(Npc_WasInState);
    cond1 = MEM_PopIntResult();

    // Additional condition: self.aivar[AIV_WASDEFEATEDBYSC]
    var int cond2;
    cond2 = G1CP_GetAIVar(slf, "AIV_WASDEFEATEDBYSC", 0);

    // Either one of the conditions
    return (cond1) || (cond2);
};
