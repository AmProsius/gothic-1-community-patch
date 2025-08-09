/*
 * #79 Wolf teaches guards dexterity instead of bandits/mercs
 */
func int G1CP_0079_WolfDexDialog() {
    var int applied; applied = FALSE;

    // Find all necessary symbols
    var int funcId; funcId = G1CP_GetFuncId("ORG_855_Wolf_Teach_Condition", "int|none");
    var int cond1Id; cond1Id = G1CP_GetIntConstId("GIL_GRD");
    var int cond2Start; cond2Start = G1CP_GetFuncStart(G1CP_GetFuncId("C_NpcBelongsToNewCamp", "int|inst"));
    if (funcId == -1) || (cond1Id == -1) || (!cond2Start) {
        return FALSE;
    };

    /* Expected function bytecode:

     0:   zPAR_TOK_PUSHVAR/INT     GIL_GRD                          (or literal integer)
     5:   zPAR_TOK_PUSHINST        HERO                             (or OTHER)
    10:   zPAR_TOK_CALLEXTERN      NPC_GETTRUEGUILD
    15:   zPAR_OP_EQUAL
    16:   zPAR_TOK_JUMPF           ORG_855_WOLF_TEACH_CONDITION+27
    21:   zPAR_TOK_PUSHVAR/INT     TRUE                             (or literal integer)
    26:   zPAR_TOK_RET
    27:   zPAR_TOK_RET
    */

    // Find "if (Npc_GetTrueGuild(xxxx) == xxxx) { ... }; "
    var int bytes[3]; // 11 bytes used
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, MEM_GetFuncId(Npc_GetTrueGuild));
    MEMINT_OFTok(zPAR_OP_EQUAL);
    MEMINT_OFTokPar(zPAR_TOK_JUMPF,      G1CP_GetFuncStart(funcId) - MEM_Parser.stack_stack+27);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 11);

    // There should only be one occurrence, otherwise the function was modified
    if (MEM_ArraySize(matches) == 1) {
        var int pos; pos = MEM_ArrayRead(matches, 0) - 10;

        // Check for "GIL_GRD"
        var int tok; tok = MEM_ReadByte(pos);
        var int par; par = MEM_ReadInt(pos+1);
        var int GIL_GRD; GIL_GRD = G1CP_GetIntConstI(cond1Id, 0, 0);
        if (((par == cond1Id) && (tok  == zPAR_TOK_PUSHVAR))    // GIL_GRD (constant)
        ||  ((par == GIL_GRD) && (tok  == zPAR_TOK_PUSHINT))) { // GIL_GRD (literal integer)

            // Check for "return 1" (literal) or "return variable with content 1" inside the if-block
            tok = MEM_ReadByte(pos+21);
            par = MEM_ReadInt(pos+22);
            if (tok == zPAR_TOK_PUSHVAR) {
                par = G1CP_GetIntI(par, 0, 0);
            } else if (tok != zPAR_TOK_PUSHINT) {
                par = 0;
            };

            /* Overwrite the entire condition: (C_NpcBelongsToNewCamp(xxxx) == TRUE)

                  Original                                       Overwrite to
             0:   zPAR_TOK_PUSHVAR/INT   GIL_GRD                 zPAR_TOK_PUSHINT   1
             5:   zPAR_TOK_PUSHINST      xxxx
            10:   zPAR_TOK_CALLEXTERN    Npc_GetTrueGuild        zPAR_TOK_CALL      C_NpcBelongsToNewCamp
            15:   zPAR_OP_EQUAL
            */
            MEMINT_OverrideFunc_Ptr = pos;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
            MEMINT_OverrideFunc_Ptr += 5;
            MEMINT_OFTokPar(zPAR_TOK_CALL, cond2Start - MEM_Parser.stack_stack);

            // Success
            applied = TRUE;
        };
    };

    // Free array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};
