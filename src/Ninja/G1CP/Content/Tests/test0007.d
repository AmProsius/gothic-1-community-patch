/*
 * #7 NPCs practice sword training without a weapon
 *
 * Two test NPCs are spawned to perform the sword practice. One of them has a sword in their inventory, the other one
 * doesn't. For technical reasons the hero will be locked and turning to one of the NPCs. It might be difficult to watch
 * both of them.
 *
 * Expected behavior: One NPC will equip and draw their weapon to perform the practice. The other will stand still.
 */
const int G1CP_Test_0007_Pass = 0;

func void G1CP_Test_0007() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckAiStateStartFunc("ZS_PracticeSword");
    G1CP_Testsuite_CheckItem("ItRw_Bow_Small_01");
    G1CP_Testsuite_CheckItem("Scars_Schwert");
    G1CP_Testsuite_CheckPassed();

    // Two passes
    G1CP_Test_0007_Pass = 0;

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0007_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0007_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Second pass
    Wld_InsertNpc(G1CP_Test_0007_Npc, wp);
};

/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_0007_Npc(C_Npc) {
    name          = "Test 7";
    attribute[0]  = 2;
    attribute[1]  = 2;
    attribute[4]  = 1000; // Enough strength to carry any weapon
    attribute[5]  = 1000; // Enough dexterity to carry any weapon
    senses        = 7;
    senses_range  = 2000;
    start_aistate = ZS_G1CP_Test_0007_NpcRountine;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
    EquipItem(self, MEM_GetSymbolIndex("ItRw_Bow_Small_01"));  // Should not be used to practice
};

/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_G1CP_Test_0007_NpcRountine() {};
func int  ZS_G1CP_Test_0007_NpcRountine_Loop() {
    // First pass: Trigger the script
    if (Npc_GetStateTime(self) <= 1) {
        // Only add the item now (spawn would have auto-equipped the sword)

        // One of the two NPCs has a weapon
        if (G1CP_Test_0007_Pass == 1) {
            CreateInvItem(self, MEM_GetSymbolIndex("Scars_Schwert"));
        };
        G1CP_Test_0007_Pass += 1;

        // Trigger the AI state
        // AI_StartState(self, symbId, 0, ""); // Does not work, expects func parameter
        MEM_PushInstParam(self);
        MEM_PushIntParam(MEM_GetSymbolIndex("ZS_PracticeSword")); // Func parameter as integer
        MEM_PushIntParam(0);
        MEM_PushStringParam("");
        MEM_Call(AI_StartState);

        // Somehow needs to end
        AI_TurnToNpc(hero, self);
        AI_Wait(hero, 5);
        AI_Function(hero, G1CP_Test_0007_Success);
        return 1;
    };
};
func void G1CP_Test_0007_NpcRemove() {
    // Delete the NPC once finished
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_0007_Npc);
};
func void G1CP_Test_0007_Success() {
    Print(ConcatStrings(ConcatStrings("Test 7 passed (PART ", IntToString(G1CP_Test_0007_Pass-1)), " of 2)"));
    G1CP_Test_0007_NpcRemove();
    G1CP_Test_0007_Pass += 1;
};
func void ZS_G1CP_Test_0007_NpcRountine_End() {
    Print(ConcatStrings(ConcatStrings("Test 7 failed (PART ", IntToString(G1CP_Test_0007_Pass-1)), " of 2)"));
    G1CP_Test_0007_NpcRemove();
    G1CP_Test_0007_Pass += 1;
};
