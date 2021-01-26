/*
 * #10 Companions don't adjust their walking speed
 *
 * A test NPC is inserted in the ZS_FollowPC state
 *
 * Expected behavior: The NPC will pick up on the hero's walking mode
 */
func void Ninja_G1CP_Test_010() {
    if (!Ninja_G1CP_TestsuiteAllowManual) {
        return;
    };

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(Ninja_G1CP_Test_010_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(Ninja_G1CP_Test_010_Npc);
    if (!Hlp_IsValidNpc(test)) {
        Ninja_G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Check for ZS_FollowPC
    var int symbId; symbId = MEM_FindParserSymbol("ZS_FollowPC");
    if (!symbId) {
        Ninja_G1CP_TestsuiteErrorDetail("'ZS_FollowPC' not found");
        return;
    };

    // Update state dynamically (to make sure it exists)
    MEM_WriteInt(_@(test.bodymass)+8, symbId);
};


/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance Ninja_G1CP_Test_010_Npc(C_Npc) {
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
instance Ninja_G1CP_Test_010_Dialog(C_Info) {
    npc         = Ninja_G1CP_Test_010_Npc;
    condition   = Ninja_G1CP_Test_010_Dialog_Condition;
    information = Ninja_G1CP_Test_010_Dialog_Info;
    important   = 1;
    permanent   = 1;
};
func int Ninja_G1CP_Test_010_Dialog_Condition() {
    var int symbId; symbId = MEM_FindParserSymbol("ZS_Talk");
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
func void Ninja_G1CP_Test_010_Dialog_Info() {
    AI_StopProcessInfos(self);
    AI_StopProcessInfos(other);

    // Delete the NPC once finished
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, Ninja_G1CP_Test_010_Npc);
};
