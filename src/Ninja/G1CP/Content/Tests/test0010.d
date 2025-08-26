/*
 * #10 Companions don't adjust their walking speed
 *
 * A test NPC is inserted in the ZS_FollowPC state
 *
 * Expected behavior: The NPC will pick up on the hero's walking mode
 */
func void G1CP_Test_0010() {
    G1CP_Testsuite_CheckManual();
    var int symbId; symbId = G1CP_Testsuite_CheckAiStateStartFunc("ZS_FollowPC");
    G1CP_Testsuite_CheckAiStateStartFunc("ZS_Talk");

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0010_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0010_Npc);
    G1CP_Testsuite_Assert(Hlp_IsValidNpc(test), TRUE);

    // Update state dynamically (to make sure it exists)
    MEM_WriteInt(_@(test.bodymass)+8, symbId);
};


/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_0010_Npc(C_Npc) {
    name          = "Test 10";
    attribute[0]  = 2;
    attribute[1]  = 2;
    senses        = 7;
    senses_range  = 2000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
};

/*
 * Add dialog to remove the NPC
 */
instance G1CP_Test_0010_Dialog(C_Info) {
    npc         = G1CP_Test_0010_Npc;
    condition   = G1CP_Test_0010_Dialog_Condition;
    information = G1CP_Test_0010_Dialog_Info;
    important   = 1;
    permanent   = 1;
};
func int G1CP_Test_0010_Dialog_Condition() {
    var int symbId; symbId = MEM_GetSymbolIndex("ZS_Talk");
    if (!symbId) {
        return FALSE;
    };
    // Npc_IsInState(self, symbId)
    MEM_PushInstParam(self);
    MEM_PushIntParam(symbId);
    MEM_Call(Npc_IsInState);
    if (MEM_PopIntResult()) {
        return TRUE;
    };
};
func void G1CP_Test_0010_Dialog_Info() {
    AI_StopProcessInfos(self);
    AI_StopProcessInfos(other);

    // Delete the NPC once finished
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_0010_Npc);
};
