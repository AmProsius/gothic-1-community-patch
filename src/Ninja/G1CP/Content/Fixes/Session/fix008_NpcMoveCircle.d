/*
 * #8 NPCs move in circles
 */
func int Ninja_G1CP_008_NpcMoveCircle() {
    var int applied1; applied1 = FALSE;
    var int applied2; applied2 = FALSE;

    // Find all necessary symbols
    var int funcId; funcId = MEM_FindParserSymbol("ZS_StandAround_Loop");
    var int bGotoFP_symbPtr; bGotoFP_symbPtr = MEM_GetSymbol("B_GotoFP");
    var int hook1_symbPtr; hook1_symbPtr = MEM_GetSymbol("Ninja_G1CP_008_GotoAndAlignFP");
    var int hook2_symbPtr; hook2_symbPtr = MEM_GetSymbol("Ninja_G1CP_008_TurnToNpcIfCanSee");
    var int alignFP_id; alignFP_id = MEM_FindParserSymbol("AI_AlignToFP");
    var int turnNpc_id; turnNpc_id = MEM_FindParserSymbol("AI_TurnToNpc");

    // Check if all needed symbols exist
    if (funcId != -1) && (bGotoFP_symbPtr) {

        // Get the byte code of the function
        var int tokens; tokens = MEM_ArrayCreate();
        var int params; params = MEM_ArrayCreate();
        var int positions; positions = MEM_ArrayCreate();
        MEMINT_TokenizeFunction(funcID, tokens, params, positions);
        var int len; len = MEM_ArraySize(tokens);

        // Func offset
        var int pos;
        var int bGotoFP_offset; bGotoFP_offset = MEM_ReadInt(bGotoFP_symbPtr + zCParSymbol_content_offset);
        var int hook1_offset; hook1_offset = MEM_ReadInt(hook1_symbPtr + zCParSymbol_content_offset);
        var int hook2_offset; hook2_offset = MEM_ReadInt(hook2_symbPtr + zCParSymbol_content_offset);

        // Iterate over the tokens
        repeat(i, len); var int i;

            // First change: Find "B_GotoFP"
            if (MEM_ArrayRead(params, i) == bGotoFP_offset)
            && (i+3 < len) { // Prevent errors below

                // Verify immediate context: B_GotoFP(xxxx, xxxx); AI_AlignToFP(xxxx)
                if (MEM_ArrayRead(tokens, i) == zPAR_TOK_CALL)
                && (MEM_ArrayRead(tokens, i+2) == zPAR_TOK_CALLEXTERN) && (MEM_ArrayRead(params, i+2) == alignFP_id) {

                    // Overwrite "B_GotoFP" with "Ninja_G1CP_008_GotoAndAlignFP"
                    pos = MEM_ArrayRead(positions, i);
                    var int to; to = MEM_ArrayRead(positions, i+3) - currParserStackAddress;
                    MEM_WriteInt(pos+1,  hook1_offset);  // B_GotoFP
                    MEM_WriteByte(pos+5, zPAR_TOK_JUMP); // zPAR_TOK_CALLEXTERN
                    MEM_WriteInt(pos+6,  to);            // AI_AlignToFP

                    applied1 += 1;
                };
                continue;
            };

            // Second change: Find "AI_TurnToNpc"
            if (MEM_ArrayRead(params, i) == turnNpc_id) {

                // Verify immediate context: AI_TurnToNpc(xxxx, xxxx)
                if (MEM_ArrayRead(tokens, i) == zPAR_TOK_CALLEXTERN) {

                    // Overwrite "AI_TurnToNpc" with "Ninja_G1CP_008_TurnToNpcIfCanSee"
                    pos = MEM_ArrayRead(positions, i);
                    MEM_WriteByte(pos,  zPAR_TOK_CALL); // zPAR_TOK_CALLEXTERN
                    MEM_WriteInt(pos+1, hook2_offset);  // AI_TurnToNpc

                    applied2 += 1;
                };
            };
        end;

        // Free all the arrays
        MEM_ArrayFree(tokens);
        MEM_ArrayFree(params);
        MEM_ArrayFree(positions);
    };

    return (applied1) && (applied2);
};

/*
 * Intercepting function
 */
func void Ninja_G1CP_008_GotoAndAlignFP(var C_Npc slf, var string fp) {
    Ninja_G1CP_ReportFuncToSpy();

    // Original condition: B_GotoFP(slf, fp)
    MEM_PushInstParam(slf);
    MEM_PushStringParam(fp);
    MEM_CallByString("B_GotoFP");

    // Wrap the alignment into an if-block
    if (!Npc_IsOnFP(slf, fp)) {
        AI_AlignToFP(slf);
    };
};
func void Ninja_G1CP_008_TurnToNpcIfCanSee(var C_Npc slf, var C_Npc oth) {
    Ninja_G1CP_ReportFuncToSpy();

    // Wrap turn function into an if-block
    if (!Npc_CanSeeNpc(slf, oth)) {
        // Original condition
        AI_TurnToNpc(slf, oth);
    };
};
