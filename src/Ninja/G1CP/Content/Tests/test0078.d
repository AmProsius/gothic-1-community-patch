/*
 * #78 Humans don't recognise orcs as monsters
 *
 * A human NPC, an orc warrior and an orc slave are inserted
 *
 * Expected behavior: The human NPC will attack the orc warrior (before the orc attacks), but leaves the orc slave alone
 */

/* Strength of the player */
const int G1CP_Test_0078_HeroStrengthBak = 0;

/*
 * Test function
 */
func void G1CP_Test_0078() {
    G1CP_Testsuite_CheckManual();
    var int warriorId; warriorId = G1CP_Testsuite_CheckNpc("OrcWarrior1");
    var int slaveId; slaveId = G1CP_Testsuite_CheckNpc("OrcSlave");
    var int ulumuluId; ulumuluId = G1CP_Testsuite_CheckItem("UluMulu");
    G1CP_Testsuite_CheckItem("Scars_Schwert");
    G1CP_Testsuite_CheckFunc("B_AssessEnemy", "void|none", "");
    G1CP_Testsuite_CheckPassed();

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0078_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0078_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Insert the orcs
    wp = Npc_GetNextWp(hero);
    Wld_InsertNpc(warriorId, wp);
    test = Hlp_GetNpc(warriorId);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("NPC 'OrcWarrior1' failed to insert");
        return;
    };
    Wld_InsertNpc(slaveId, wp);
    test = Hlp_GetNpc(slaveId);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("NPC 'OrcSlave' failed to insert");
        return;
    };

    // Give Ulumulu to player (enough strength too)
    const int ATR_STRENGTH = 4;
    G1CP_Test_0078_HeroStrengthBak = hero.attribute[ATR_STRENGTH];
    if (hero.attribute[ATR_STRENGTH] < 100) {
        hero.attribute[ATR_STRENGTH] = 100;
    };
    CreateInvItem(hero, ulumuluId);
    EquipWeapon(hero, ulumuluId);
};


/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_0078_Npc(C_Npc) {
    name          = "Test 78";
    level         = 2000; // No coward
    attribute[0]  = 2000;
    attribute[1]  = 2000;
    attribute[4]  = 1000; // Enough strength to carry any weapon
    start_aistate = ZS_G1CP_Test_0078_NpcRountine;
    fight_tactic  = 4; // FAI_HUMAN_MASTER
    senses        = 7;
    senses_range  = 4000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
    EquipItem(self, MEM_GetSymbolIndex("Scars_Schwert"));
};


/*
 * AI state is stared once the NPC is properly inserted
 */
func void ZS_G1CP_Test_0078_NpcRountine() {
    // Define possibly missing symbols locally
    const int PERC_ASSESSENEMY = 2;

    // Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
    MEM_PushInstParam(self);
    PERC_ASSESSENEMY;
    MEM_GetSymbolIndex("B_AssessEnemy");
    MEM_Call(Npc_PercEnable);

    Npc_SetPercTime(self, 0.5);
};
func int  ZS_G1CP_Test_0078_NpcRountine_Loop() {
    var int detected;
    if (Npc_GetStateTime(self) < 3) || (!detected) {
        detected = FALSE;
        Npc_PerceiveAll(self);
        if (Wld_DetectNpc(self, MEM_GetSymbolIndex("OrcWarrior1"), NOFUNC, -1)) {
            if (Npc_CanSeeNpc(self, other)) {
                detected = TRUE;
            } else {
                AI_TurnToNpc(self, other);
            };
        };
    } else if (detected) {
        return 1;
    };
    return 0;
};
func void ZS_G1CP_Test_0078_NpcRountine_End() {
    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Delete the NPCs once done
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_0078_Npc);
    Wld_RemoveNpc(MEM_GetSymbolIndex("OrcWarrior1"));
    Wld_RemoveNpc(MEM_GetSymbolIndex("OrcSlave"));
    Npc_RemoveInvItem(hero, MEM_GetSymbolIndex("UluMulu"));
    hero.attribute[ATR_STRENGTH] = G1CP_Test_0078_HeroStrengthBak;
};
