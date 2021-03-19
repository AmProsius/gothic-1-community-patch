/*
 * #78 Humans don't recognise orcs as monsters
 *
 * A human NPC, an orc warrior and an orc slave are inserted
 *
 * Expected behavior: The human NPC will attack the orc warrior (before the orc attacks), but leaves the orc slave alone
 */

/* Strength of the player */
const int G1CP_Test_078_HeroStrengthBak = 0;

/*
 * Test function
 */
func void G1CP_Test_078() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check for orc warrior and orc slave
    var int warriorId; warriorId = MEM_GetSymbolIndex("OrcWarrior1");
    if (warriorId == -1)  {
        G1CP_TestsuiteErrorDetail("NPC 'OrcWarrior1' not found");
        return;
    };
    var int slaveId; slaveId = MEM_GetSymbolIndex("OrcSlave");
    if (slaveId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'OrcSlave' not found");
        return;
    };

    // Check for Ulumulu
    var int ulumuluId; ulumuluId = MEM_GetSymbolIndex("UluMulu");
    if (ulumuluId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'UluMulu' not found");
    };

    // Require perceptions
    var int percId; percId = MEM_GetSymbolIndex("B_AssessEnemy");
    if (percId == -1) {
        G1CP_TestsuiteErrorDetail("Function 'B_AssessEnemy' not found");
    };

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(G1CP_Test_078_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_078_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Insert the orcs
    wp = Npc_GetNextWP(hero);
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
    G1CP_Test_078_HeroStrengthBak = hero.attribute[ATR_STRENGTH];
    if (hero.attribute[ATR_STRENGTH] < 100) {
        hero.attribute[ATR_STRENGTH] = 100;
    };
    CreateInvItem(hero, ulumuluId);
    EquipWeapon(hero, ulumuluId);
};


/*
 * The actual test will run through the NPC's AI state (see below)
 */
instance G1CP_Test_078_Npc(C_Npc) {
    name          = "Test 78";
    level         = 2000; // No coward
    attribute[0]  = 2000;
    attribute[1]  = 2000;
    attribute[4]  = 1000; // Enough strength to carry any weapon
    start_aistate = ZS_G1CP_Test_078_NpcRountine;
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
func void ZS_G1CP_Test_078_NpcRountine() {
    // Define possibly missing symbols locally
    const int PERC_ASSESSENEMY = 2;

    // Npc_PercEnable(self, PERC_ASSESSENEMY, B_AssessEnemy);
    MEM_PushInstParam(self);
    PERC_ASSESSENEMY;
    MEM_GetSymbolIndex("B_AssessEnemy");
    MEM_Call(Npc_PercEnable);

    Npc_SetPercTime(self, 0.5);
};
func int  ZS_G1CP_Test_078_NpcRountine_Loop() {
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
func void ZS_G1CP_Test_078_NpcRountine_End() {
    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Delete the NPCs once done
    MEM_WriteInt(_@(self.bodymass)+8, 0); // Clear start_aistate
    AI_Function_I(hero, Wld_RemoveNpc, G1CP_Test_078_Npc);
    Wld_RemoveNpc(MEM_GetSymbolIndex("OrcWarrior1"));
    Wld_RemoveNpc(MEM_GetSymbolIndex("OrcSlave"));
    Npc_RemoveInvItem(hero, MEM_GetSymbolIndex("UluMulu"));
    hero.attribute[ATR_STRENGTH] = G1CP_Test_078_HeroStrengthBak;
};
