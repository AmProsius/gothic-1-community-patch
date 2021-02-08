/*
 * #12 Double exp when killing an NPC with a ranged weapon
 */
func int Ninja_G1CP_012_RangedDoubleXP() {
    var int applied; applied = FALSE;

    // Find all necessary symbols
    var int funcId; funcId = MEM_FindParserSymbol("B_DeathXP");
    var int cond1Id; cond1Id = MEM_FindParserSymbol("ZS_Unconscious");
    var int cond2Id; cond2Id = MEM_GetSymbol("Ninja_G1CP_012_RangedDoubleXP_Condition");
    var int cond3Id; cond3Id = MEM_FindParserSymbol("AIV_WASDEFEATEDBYSC");
    var int funcExt; funcExt = MEM_FindParserSymbol("Npc_WasInState");

    // Check if all needed symbols exist
    if (funcId != -1) && (cond1Id != -1) && (cond3Id != -1) {

        // Get the byte code of the function
        var int tokens; tokens = MEM_ArrayCreate();
        var int params; params = MEM_ArrayCreate();
        var int positions; positions = MEM_ArrayCreate();
        MEMINT_TokenizeFunction(funcID, tokens, params, positions);
        var int len; len = MEM_ArraySize(tokens);

        // Iterate over the tokens
        repeat(i, len); var int i;

            // Find "ZS_Unconscious"
            if (MEM_ArrayRead(params, i) == cond1Id)
            && (i+2 < len) { // Prevent errors below

                // Verify immediate context: Npc_WasInState(xxxx, ZS_Unconscious)
                if (MEM_ArrayRead(tokens, i) == zPAR_TOK_PUSHINT)
                && (MEM_ArrayRead(tokens, i+1) == zPAR_TOK_CALLEXTERN) && (MEM_ArrayRead(params, i+1) == funcExt)
                && (MEM_ArrayRead(tokens, i+2) != zPAR_OP_UN_NOT) {

                    // Overwrite "Npc_WasInState" with "Ninja_G1CP_012_RangedDoubleXP_Condition"
                    var int pos; pos = MEM_ArrayRead(positions, i+1);
                    MEM_WriteByte(pos, zPAR_TOK_CALL);
                    MEM_WriteInt(pos+1, MEM_ReadInt(cond2Id + zCParSymbol_content_offset));

                    // That's all
                    applied = TRUE;
                    break;
                };
            };
        end;

        // Free all the arrays
        MEM_ArrayFree(tokens);
        MEM_ArrayFree(params);
        MEM_ArrayFree(positions);
    };

    return applied;
};

/*
 * Intercepting function
 */
func int Ninja_G1CP_012_RangedDoubleXP_Condition(var C_Npc slf, var int state) {
    Ninja_G1CP_ReportFuncToSpy();

    // Original condition: Npc_WasInState(self, ZS_Unconscious)
    var int cond1;
    MEM_PushInstParam(slf);
    MEM_PushIntParam(state);
    MEM_Call(Npc_WasInState);
    cond1 = MEM_PopIntResult();

    // Additional condition: self.aivar[AIV_WASDEFEATEDBYSC]
    var int cond2;
    cond2 = Ninja_G1CP_GetAIVar(slf, "AIV_WASDEFEATEDBYSC", 0);

    // Either one of the conditions
    return (cond1) || (cond2);
};
