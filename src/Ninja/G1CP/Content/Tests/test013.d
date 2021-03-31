/*
 * #13 NPCs draw weapon on dead monsters
 *
 * A test NPC and a scavenger is inserted. The scavenger is killed off.
 *
 * Expected behavior: The NPC does not react to the dead monster.
 */
func void G1CP_Test_013() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check if AI state exists
    var int symbId; symbId = MEM_GetSymbolIndex("ZS_StandAround");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("AI state 'ZS_StandAround' not found");
        return;
    };

    // Check if monster exists
    var int scavengerId; scavengerId = MEM_GetSymbolIndex("Scavenger");
    if (scavengerId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Scavenger' not found");
        return;
    };

    // Insert dead monster
    var string wp; wp = Npc_GetNextWP(hero);
    Wld_InsertNpc(scavengerId, wp);
    var C_Npc monster; monster = Hlp_GetNpc(scavengerId);
    if (!Hlp_IsValidNpc(monster)) {
        G1CP_TestsuiteErrorDetail("Failed to insert monster NPC");
        return;
    };

    // Insert test NPC
    wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(G1CP_Test_013_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_013_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };
};

/*
 * Testing NPC to see reaction
 */
instance G1CP_Test_013_Npc(C_Npc) {
    name          = "Test 13";
    attribute[0]  = 2;
    attribute[1]  = 2;
    senses        = 7;
    senses_range  = 2000;
    start_aistate = ZS_G1CP_Test_013_NpcRountine;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
};

/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_G1CP_Test_013_NpcRountine() {};
func int  ZS_G1CP_Test_013_NpcRountine_Loop() {

    // Define possibly missing symbols locally
    const int ATR_HITPOINTS = 0;

    // Trigger the reaction
    if (Npc_GetStateTime(self) > 1) {
        // Only kill off the monster now, cannot spawn an already dead monster
        var C_Npc monster; monster = Hlp_GetNpc(MEM_GetSymbolIndex("Scavenger"));
        monster.attribute[ATR_HITPOINTS] = 0;

        // AI_StartState(self, symbId, 0, ""); // Does not work, expects func parameter
        MEM_PushInstParam(self);
        MEM_PushIntParam(MEM_GetSymbolIndex("ZS_StandAround")); // Func parameter as integer
        MEM_PushIntParam(0);
        MEM_PushStringParam("");
        MEM_Call(AI_StartState);
        return 1;
    };
    return 0;
};
func void ZS_G1CP_Test_013_NpcRountine_End() {};

/*
 * Add dialog to remove the NPC
 */
instance G1CP_Test_013_Dialog(C_Info) {
    npc         = G1CP_Test_013_Npc;
    condition   = G1CP_Test_013_Dialog_Condition;
    information = G1CP_Test_013_Dialog_Info;
    important   = 1;
    permanent   = 1;
};
func int G1CP_Test_013_Dialog_Condition() {
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
func void G1CP_Test_013_Dialog_Info() {
    AI_StopProcessInfos(self);
    AI_StopProcessInfos(other);

    // Delete the NPC once finished
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_013_Npc);
};
