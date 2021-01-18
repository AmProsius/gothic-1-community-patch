/*
 * #7 NPCs practice sword training without a weapon
 *
 * Two test NPCs are spawned to perform the sword practice. One of them has a sword in their inventory, the other one
 * doesn't. For technical reasons the hero will be locked and turning to one of the NPCs. It might be difficult to watch
 * both of them.
 *
 * Expected behavior: One NPC will equip and draw their weapon to perform the practice. The other will stand still.
 */
const int Ninja_G1CP_Test_007_Pass = 0;

func void Ninja_G1CP_Test_007() {
    if (!Ninja_G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check if AI state exists
    var int symbId; symbId = MEM_FindParserSymbol("ZS_PracticeSword");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(7, "AI state 'ZS_PracticeSword' does not exist");
        return;
    };

    // Two passes
    Ninja_G1CP_Test_007_Pass = 0;

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(Ninja_G1CP_Test_007_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(Ninja_G1CP_Test_007_Npc);
    if (!Hlp_IsValidNpc(test)) {
        Ninja_G1CP_TestsuiteErrorDetail(7, "Failed to insert NPC");
        return;
    };

    // Second pass
    Wld_InsertNpc(Ninja_G1CP_Test_007_Npc, wp);
};

/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance Ninja_G1CP_Test_007_Npc(C_Npc) {
    name          = "Test 7";
    attribute[0]  = 2;
    attribute[1]  = 2;
    attribute[4]  = 1000; // Enough strength to carry any weapon
    attribute[5]  = 1000; // Enough dexterity to carry any weapon
    senses        = 7;
    senses_range  = 2000;
    start_aistate = ZS_Ninja_G1CP_Test_007_NpcRountine;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
    EquipItem(self, MEM_FindParserSymbol("ItRw_Bow_Small_01"));  // Should not be used to practice
};

/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_Ninja_G1CP_Test_007_NpcRountine() {};
func int  ZS_Ninja_G1CP_Test_007_NpcRountine_Loop() {
    // First pass: Trigger the script
    if (Npc_GetStateTime(self) <= 1) {
        // Only add the item now (spawn would have auto-equipped the sword)

        // One of the two NPCs has a weapon
        if (Ninja_G1CP_Test_007_Pass == 1) {
            CreateInvItem(self, MEM_FindParserSymbol("Scars_Schwert"));
        };
        Ninja_G1CP_Test_007_Pass += 1;

        // Trigger the AI state
        var int symbId; symbId = MEM_FindParserSymbol("ZS_PracticeSword");
        if (symbId != -1) {
            // AI_StartState(self, symbId, 0, ""); // Does not work, expects func parameter
            MEM_PushInstParam(self);
            MEM_PushIntParam(symbId); // Func parameter as integer
            MEM_PushIntParam(0);
            MEM_PushStringParam("");
            MEM_Call(AI_StartState);

            // Somehow needs to end
            AI_TurnToNpc(hero, self);
            AI_Wait(hero, 5);
            AI_Function(hero, Ninja_G1CP_Test_007_Success);
        } else {
            // Send to zSpy directly here because it is after the test has finished
            MEM_SendToSpy(zERR_TYPE_FAULT, "  Test   7: AI state 'ZS_PracticeSword' does not exist");
        };
        return 1;
    };
};
func void Ninja_G1CP_Test_007_NpcRemove() {
    // Delete the NPC once finished
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, Ninja_G1CP_Test_007_Npc);
};
func void Ninja_G1CP_Test_007_Success() {
    Print(ConcatStrings(ConcatStrings("Test 3 passed (PART ", IntToString(Ninja_G1CP_Test_007_Pass-1)), " of 2)"));
    Ninja_G1CP_Test_007_NpcRemove();
    Ninja_G1CP_Test_007_Pass += 1;
};
func void ZS_Ninja_G1CP_Test_007_NpcRountine_End() {
    Print(ConcatStrings(ConcatStrings("Test 3 failed (PART ", IntToString(Ninja_G1CP_Test_007_Pass-1)), " of 2)"));
    Ninja_G1CP_Test_007_NpcRemove();
    Ninja_G1CP_Test_007_Pass += 1;
};
