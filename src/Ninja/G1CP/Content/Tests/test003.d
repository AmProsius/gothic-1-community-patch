/*
 * #3 NPCs don't collect weapons after fight
 *
 * A test NPC is inserted along with some weapons (bow equipped), before the script B_RegainDroppedWeapon is triggered
 *
 * Expected behavior: The NPC will pick up and equip the sword, leave the bow, draw the sword and show it
 */
func void G1CP_Test_003() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckAiStateStartFunc("ZS_PracticeSword");
    var int symbId1; symbId1 = G1CP_Testsuite_CheckItem("Whistlers_Schwert");
    var int symbId2; symbId2 = G1CP_Testsuite_CheckItem("Wolfs_Bogen");
    var int symbId3; symbId3 = G1CP_Testsuite_CheckItem("ItAmArrow");
    G1CP_Testsuite_CheckItem("Diegos_Bogen");
    G1CP_Testsuite_CheckItem("ItRw_Bow_Small_01");
    G1CP_Testsuite_CheckFunc("B_RegainDroppedWeapon", "void|C_Npc", "");
    G1CP_Testsuite_CheckPassed();

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(G1CP_Test_003_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_003_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Insert items
    wp = Npc_GetNearestWP(hero);
    Wld_InsertItem(symbId1, wp);
    Wld_InsertItem(symbId2, wp);
    Wld_InsertItem(symbId3, wp);
};



/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_003_Npc(C_Npc) {
    name          = "Test 3";
    attribute[0]  = 2;
    attribute[1]  = 2;
    attribute[4]  = 1000; // Enough strength to carry any weapon
    attribute[5]  = 1000; // Enough dexterity to carry any weapon
    start_aistate = ZS_G1CP_Test_003_NpcRountine;
    senses        = 7;
    senses_range  = 2000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
    EquipItem(self, MEM_GetSymbolIndex("ItRw_Bow_Small_01"));  // Should not be replaced
    CreateInvItem(self, MEM_GetSymbolIndex("Diegos_Bogen"));   // by this one (stronger)
    // EquipItem(self, MEM_GetSymbolIndex("ItMw_1H_Club_01"));    // Same for melee weapon
    // CreateInvItem(self, MEM_GetSymbolIndex("Scars_Schwert"));  // ...
    CreateInvItems(self, MEM_GetSymbolIndex("ItAmArrow"), 20); // Need arrows for AI_EquipBestRangedWeapon
};


/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_G1CP_Test_003_NpcRountine() {};
func int  ZS_G1CP_Test_003_NpcRountine_Loop() {
    // First pass: Trigger the script
    if (Npc_GetStateTime(self) <= 1) {
        MEM_PushInstParam(self);
        MEM_CallByString("B_RegainDroppedWeapon");
        Npc_SetStateTime(self, 2);
        return 0;
    };

    // Second pass: Show off if it worked
    var int failed; failed = FALSE;
    if (!Npc_HasEquippedMeleeWeapon(self)) {
        // Send to zSpy directly here because it is after the test has finished
        MEM_SendToSpy(zERR_TYPE_FAULT, "  Test   3: NPC did not pickup/equip the melee weapon");
        failed = TRUE;
    };
    if (Npc_GetRangedWeapon(self) != MEM_GetSymbolIndex("ItRw_Bow_Small_01")) {
        // Send to zSpy directly here because it is after the test has finished
        MEM_SendToSpy(zERR_TYPE_FAULT, "  Test   3: NPC illegitimately equipped the best bow");
        failed = TRUE;
    };
    if (!failed) {
        // Test passed: Celebrate!
        AI_ReadyMeleeWeapon(self);
        AI_PlayAni(self, "T_IGETYOU");
        Print("Test 3 passed");
    };
    return 1;
};
func void ZS_G1CP_Test_003_NpcRountine_End() {
    // Delete the NPC once done
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_003_Npc);
};
