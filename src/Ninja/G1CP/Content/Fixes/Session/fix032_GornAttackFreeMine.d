/*
 * #32 Gorn attacks the player in the Free Mine
 */
func int G1CP_032_GornAttackFreeMine() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int memFncId; memFncId = MEM_GetSymbolIndex("B_AssessAndMemorize");
    var int assFncId; assFncId = MEM_GetSymbolIndex("B_AssessFightSound");
    var int state1Id; state1Id = MEM_GetSymbolIndex("ZS_ProclaimAndPunish");
    var int state2Id; state2Id = MEM_GetFuncId(G1CP_032_GornAttackFreeMine_AttackRelay);
    var int sstateId; sstateId = MEM_GetFuncId(AI_StartState);
    if (memFncId == -1) || (assFncId == -1) || (state1Id == -1) || (MEM_GetSymbolIndex("ZS_Attack") == -1) {
        return FALSE;
    };

    // Find "ZS_ProclaimAndPunish" in "B_AssessFightSound"
    const int bytes[2] = {zPAR_TOK_PUSHINT<<24, -1};
    bytes[1] = state1Id;
    var int matches; matches = G1CP_FindInFunc(assFncId, _@(bytes)+3, 5);

    // Iterate over all occurrences of "ZS_ProclaimAndPunish"
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Verify context (starting AI state)
        if (MEM_ReadByte(pos+15) == zPAR_TOK_CALLEXTERN)
        && (MEM_ReadInt(pos+16)  == sstateId) {

            // Overwrite "ZS_ProclaimAndPunish" with "G1CP_032_GornAttackFreeMine_AttackRelay"
            MEMINT_OverrideFunc_Ptr = pos;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINT, state2Id);

            applied += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    // Intercept Gorn witnessing terrible things
    if (applied) {
        HookDaedalusFuncI(memFncId, MEM_GetFuncId(G1CP_032_GornAttackFreeMine_NoTrauma));
    };

    return applied;
};

/*
 * Intercept starting the state "ZS_ProclaimAndPunish" from "B_AssessFightSound"
 */
func void G1CP_032_GornAttackFreeMine_AttackRelay() {
    G1CP_ReportFuncToSpy();

    // Punish PC, attack NPC
    if (Npc_IsPlayer(other)) {
        // AI_StartState(self, ZS_ProclaimAndPunish, 0, ""); // Does not work, expects func parameter
        MEM_PushInstParam(self);
        MEM_PushIntParam(MEM_GetSymbolIndex("ZS_ProclaimAndPunish")); // Func parameter as integer
        MEM_PushIntParam(0);
        MEM_PushStringParam("");
        MEM_Call(AI_StartState);
    } else {
        Npc_SetTarget(self, other);
        // AI_StartState(self, ZS_Attack, 0, ""); // Does not work, expects func parameter
        MEM_PushInstParam(self);
        MEM_PushIntParam(MEM_GetSymbolIndex("ZS_Attack")); // Func parameter as integer
        MEM_PushIntParam(0);
        MEM_PushStringParam("");
        MEM_Call(AI_StartState);
    };
};

/*
 * Intercept the creation of memories for Gorn in the Free Mine
 */
func void G1CP_032_GornAttackFreeMine_NoTrauma(var int newsid, var int source, var C_Npc witness,
                                                     var C_Npc offender, var C_Npc vict) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int GIL_GRD = 2;
    const int GIL_STT = 3;
    const int GIL_VLK = 5;

    // Update the symbols given they exist (once)
    const int fighterFMid = -1;
    const int updated = FALSE;
    if (!updated) {
        GIL_GRD = G1CP_GetIntConst("GIL_GRD", 0, GIL_GRD);
        GIL_STT = G1CP_GetIntConst("GIL_STT", 0, GIL_STT);
        GIL_VLK = G1CP_GetIntConst("GIL_VLK", 0, GIL_VLK);
        fighterFMid = MEM_GetSymbolIndex("PC_FighterFM");
        updated = TRUE;
    };

    // Interested in Gorn (Free Mine) only
    if (Hlp_GetInstanceId(witness) == fighterFMid) {
        // Ignore death/defeat of Old Camp members and events that did not even involve the player
        if (victim.guild == GIL_VLK) || (victim.guild == GIL_STT) || (victim.guild == GIL_GRD)
        || ((!Npc_IsPlayer(victim)) && (!Npc_IsPlayer(offender))) {
            return;
        };
    };

    // Call the original function
    PassArgumentI(newsid);
    PassArgumentI(source);
    PassArgumentN(witness);
    PassArgumentN(offender);
    PassArgumentN(vict);
    ContinueCall();
};
