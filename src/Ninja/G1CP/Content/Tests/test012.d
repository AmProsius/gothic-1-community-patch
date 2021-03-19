/*
 * #12 Double exp when killing an NPC with a ranged weapon
 *
 * A test NPC is inserted and the hero is given a bow and some arrows
 *
 * Expected behavior: The NPC will not give XP again when first downed by hand and then killed with bow and arrow
 */
func void G1CP_Test_012() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check symbols first
    if (MEM_GetSymbolIndex("B_DeathXP") == -1) {
        G1CP_TestsuiteErrorDetail("Function 'B_DeathXP' not found");
        return;
    };
    if (MEM_GetSymbolIndex("AIV_WASDEFEATEDBYSC") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'AIV_WASDEFEATEDBYSC' not found");
        return;
    };

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(G1CP_Test_012_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_012_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return;
    };

    // Give bow and arrow to player
    var int symbId;
    symbId = MEM_GetSymbolIndex("ItRw_Bow_Small_01");
    if (symbId != -1) {
        CreateInvItem(hero, symbId);
    };
    symbId = MEM_GetSymbolIndex("ItAmArrow");
    if (symbId != -1) {
        CreateInvItems(hero, symbId, 20);
    };
};

instance G1CP_Test_012_Npc(C_Npc) {
    name          = "Test 12";
    attribute[0]  = 2;
    attribute[1]  = 2;
    senses        = 7;
    senses_range  = 2000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
};
