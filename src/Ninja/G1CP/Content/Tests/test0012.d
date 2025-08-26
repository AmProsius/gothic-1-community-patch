/*
 * #12 Double exp when killing an NPC with a ranged weapon
 *
 * A test NPC is inserted and the hero is given a bow and some arrows
 *
 * Expected behavior: The NPC will not give XP again when first downed by hand and then killed with bow and arrow
 */
func void G1CP_Test_0012() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckFunc("B_DeathXP", "void|none", "");
    G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC");
    var int bowId; bowId = G1CP_Testsuite_CheckItem("ItRw_Bow_Small_01");
    var int arrowId; arrowId = G1CP_Testsuite_CheckItem("ItAmArrow");

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0012_Npc, wp);
    var C_Npc test; test = Hlp_GetNpc(G1CP_Test_0012_Npc);
    G1CP_Testsuite_Assert(Hlp_IsValidNpc(test), TRUE);

    // Give bow and arrow to player
    CreateInvItem(hero, bowId);
    CreateInvItems(hero, arrowId, 20);
};

instance G1CP_Test_0012_Npc(C_Npc) {
    name          = "Test 12";
    attribute[0]  = 2;
    attribute[1]  = 2;
    senses        = 7;
    senses_range  = 2000;
    Mdl_SetVisual(self, "HUMANS.MDS");
    Mdl_SetVisualBody(self, "HUM_BODY_NAKED0", 1, 1, "Hum_Head_Fighter", 1, 1, -1);
};
