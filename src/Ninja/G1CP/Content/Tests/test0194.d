/*
 * #194 NPCs do not collect the weapon after defeating an opponent
 *
 * A test NPC is inserted with the state ZS_AssessBody_RecoverWeapon and a weapon is placed on the ground
 *
 * Expected behavior: The NPC will pick up the weapon
 */
func void G1CP_Test_0194() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckAiStateStartFunc("ZS_AssessBody_RecoverWeapon");
    var int swordId; swordId = G1CP_Testsuite_CheckItem("Whistlers_Schwert");
    G1CP_Testsuite_CheckPassed();

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0194_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0194_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Insert items
    wp = Npc_GetNearestWp(hero);
    Wld_InsertItem(swordId, wp);

    // Reset the global instance "item" for this test
    item = MEM_NullToInst();
};


/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_0194_Npc(C_Npc) {
    name          = "Test 194";
    attribute[0]  = 2;
    attribute[1]  = 2;
    start_aistate = ZS_G1CP_Test_0194_NpcRountine;
    senses        = 7;
    senses_range  = 2000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
};


/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_G1CP_Test_0194_NpcRountine() {};
func int  ZS_G1CP_Test_0194_NpcRountine_Loop() {
    // Help out to abort here
    if (Npc_HasItems(self, MEM_GetSymbolIndex("Whistlers_Schwert"))) {
        Npc_ClearAiQueue(hero);
        AI_Function(hero, G1CP_Test_0194_Success);
        return 1;
    };

    // AI_StartState(self, symbId, 0, ""); // Does not work, expects func parameter
    MEM_PushInstParam(self);
    MEM_PushIntParam(MEM_GetSymbolIndex("ZS_AssessBody_RecoverWeapon")); // Func parameter as integer
    MEM_PushIntParam(0);
    MEM_PushStringParam("");
    MEM_Call(AI_StartState);

    // Somehow needs to end
    AI_TurnToNpc(hero, self);
    AI_Wait(hero, 5);
    AI_Function(hero, G1CP_Test_0194_Success);
    return 1;
};
func void G1CP_Test_0194_Success() {
    // Check if the NPC picked up the weapon
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0194_Npc);
    if (Npc_HasItems(test, MEM_GetSymbolIndex("Whistlers_Schwert"))) {
        Print("Test 194 passed");
    } else {
        MEM_SendToSpy(zERR_TYPE_FAULT, "  Test 194: NPC did not pickup the weapon");
    };

    // Delete the NPC once done
    MEM_WriteInt(_@(test.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_0194_Npc);
};
