/*
 * #60 Jesse's quest not available
 */
func int Ninja_G1CP_060_JesseQuest() {
    var int applied; applied = FALSE;

    // Find all necessary symbols
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Jesse_Mission_Condition");
    var int cond1Id; cond1Id = MEM_FindParserSymbol("DIA_Jesse_Mission");
    var int cond2Id; cond2Id = MEM_FindParserSymbol("DIA_Jesse_Warn");
    var int funcExt; funcExt = MEM_FindParserSymbol("Npc_KnowsInfo");
    var int trueId; trueId = MEM_FindParserSymbol("TRUE");

    // Check if all needed functions exist
    if (funcId != -1) && (cond1Id != -1) && (cond2Id != -1) {

        // Get the byte code of the dialog condition function
        var int tokens; tokens = MEM_ArrayCreate();
        var int params; params = MEM_ArrayCreate();
        var int positions; positions = MEM_ArrayCreate();
        MEMINT_TokenizeFunction(funcID, tokens, params, positions);
        var int len; len = MEM_ArraySize(tokens);

        // Iterate over the tokens
        repeat(i, len); var int i;

            // Find "DIA_Jesse_Mission"
            if (MEM_ArrayRead(params, i) == cond1Id)
            && (i+4 < len) { // Prevent error below

                // Verify the context: if (Npc_KnowsInfo(xxxx, "DIA_Jesse_Mission")) { return TRUE; ...
                if (MEM_ArrayRead(tokens, i)   == zPAR_TOK_PUSHINT)
                && (MEM_ArrayRead(tokens, i+1) == zPAR_TOK_CALLEXTERN) && (MEM_ArrayRead(params, i+1) == funcExt)
                && (MEM_ArrayRead(tokens, i+2) == zPAR_TOK_JUMPF)
                && (((MEM_ArrayRead(tokens, i+3) == zPAR_TOK_PUSHVAR) && (MEM_ArrayRead(params, i+3) == trueId))
                ||  ((MEM_ArrayRead(tokens, i+3) == zPAR_TOK_PUSHINT) && (MEM_ArrayRead(params, i+3) == TRUE)))
                && (MEM_ArrayRead(tokens, i+4) == zPAR_TOK_RET) {

                    // Overwrite "DIA_Jesse_Mission" with "DIA_Jesse_Warn"
                    var int pos; pos = MEM_ArrayRead(positions, i)+1; // Tok+1 = Param
                    MEM_WriteInt(pos, cond2Id);

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
