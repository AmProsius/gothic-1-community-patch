/*
 * #115 Dummy Templars survive in orc graveyard
 */
func int G1CP_115_KillSittingDuck() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = G1CP_GetFuncId("ZS_SittingDuck_Loop", "void|none"); // Strangely it's void
    if (funcId == -1) {
        return FALSE;
    };

    // Identify the content of the function to find if it is unmodified as found in the original
    var int bytes[4];
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST,   self);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT,    FLOATONE);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, MEM_GetFuncId(AI_Wait));
    MEMINT_OFTok(zPAR_TOK_RET);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 16);

    // There should be only one call to "AI_Wait(self, 1)" otherwise the function may have been modified
    if (MEM_ArraySize(matches) == 1) {
        // Check if there is more in the function
        var int pos; pos = MEM_ArrayRead(matches, 0);
        var int funcStart; funcStart = G1CP_GetFuncStart(funcId);

        // Check remaining part of the function byte code: Either nothing or debug function call
        var int valid; valid = FALSE;
        if (pos == funcStart) {
            valid = TRUE;
        } else if (pos - funcStart == 15) && (MEM_ReadByte(pos-5) == zPAR_TOK_CALL) {
            var int funcOffset; funcOffset = MEM_ReadInt(pos-4);
            if (funcOffset >= 0) && (funcOffset < MEM_Parser.stack_stacksize) {
                valid = (MEM_GetFuncIdByOffset(funcOffset) == G1CP_GetFuncId("PrintDebugNpc", "void|int|string"));
            };
        };

        // Now we can be sure, that we are not overwriting anything
        if (valid) {
            // Replace the function call to "AI_Wait" with our own
            MEMINT_OverrideFunc_Ptr = pos+10;
            MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_115_KillSittingDuck_Intercept));
            applied = TRUE;
        };
    };

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * Intercept the loop of the NPC state
 */
func int G1CP_115_KillSittingDuck_Intercept(var C_Npc self, var float ms) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int ATR_HITPOINTS     = 0;
    const int LOOP_CONTINUE     = 0;
    const int LOOP_END          = 1;
    const int PERC_ASSESSDAMAGE = 8;

    // Safety check: Only consider who we know
    const int npc1443 = -2; // -1 indicates invalid symbols
    const int npc1444 = -2;
    const int npc1445 = -2;
    const int npc1446 = -2;
    const int npc1463 = -2;
    if (npc1443 == -2) {
        npc1443 = G1CP_GetNpcInstId("TPL_1443_Templer");
        npc1444 = G1CP_GetNpcInstId("TPL_1444_Templer");
        npc1445 = G1CP_GetNpcInstId("TPL_1445_Templer");
        npc1446 = G1CP_GetNpcInstId("TPL_1446_Templer");
        npc1463 = G1CP_GetNpcInstId("TPL_1463_Templer");
    };
    var int slfId; slfId = Hlp_GetInstanceId(self);
    if (slfId != npc1443) && (slfId != npc1444) && (slfId != npc1445) && (slfId != npc1446) && (slfId != npc1463) {
        // Execute original code for anyone else
        AI_Wait(self, ms);
        return LOOP_CONTINUE;
    };

    // Some additional safety
    if (Npc_IsDead(self)) {
        return LOOP_END;
    };

    // Send damage perception to all nearby enemies (exclude friendly NPCs, therefore not passive perception)
    Npc_PerceiveAll(self);
    var int slfPtr; slfPtr = _@(self);
    var int count; count = 0;
    while(Npc_GetNextTarget(self));
        // This enemy is in range/sight, pretend to attack
        if (Npc_GetDistToNpc(self, other) < 1200) // 12 m
        || (Npc_CanSeeNpcFreeLos(other, self)) {
            Npc_SendSinglePerc(self, other, PERC_ASSESSDAMAGE); // You will think I hurt you, kill me now!
            count += 1;
        };

        // Remove that enemy from the perception list to advance to the next one
        var int vobPtr; vobPtr = _@(other);
        const int oCNpc__RemoveFromVobList = 7041152; //0x6B7080
        const int call = 0;
        if (CALL_Begin(call)) {
            CALL_PtrParam(_@(vobPtr));
            CALL__thiscall(_@(slfPtr), oCNpc__RemoveFromVobList);
            call = Call_End();
        };

        // Reset enemy/other for the next iteration
        Npc_SetTarget(self, NULL);
    end;

    // No enemies around and player too close? Commit suicide
    if (count < 1) && (Npc_GetDistToPlayer(self) < 2500) {
        Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS]);
        return LOOP_END;
    };

    // Continue otherwise
    AI_Wait(self, 0.1);
    return LOOP_CONTINUE;
};
