/*
 * #192 Mages auto-equip melee/ranged weapons
 *
 * A test NPC (magic user) is inserted without any weapon equipped but Thorus's sword in the inventory (strong weapon).
 *
 * Expected behavior: The NPC does not auto-equip the weapon.
 */
instance G1CP_Test_0192_Npc(C_Npc) {
    const int FAI_HUMAN_MAGE = 25;
    name         = "Test 192";
    attribute[0] = 2;
    attribute[1] = 2;
    attribute[4] = 1000; // Enough strength to carry any weapon
    fight_tactic = FAI_HUMAN_MAGE;
    Mdl_SetVisual(self, "HUMANS.MDS");
    CreateInvItem(self, MEM_GetSymbolIndex("Thorus_Schwert"));
};
func void G1CP_Test_0192() {
    G1CP_Testsuite_CheckItem("Thorus_Schwert");

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0192_Npc, wp);
    var zCVob test; test = Hlp_GetNpc(G1CP_Test_0192_Npc);
    G1CP_Testsuite_Assert(Hlp_IsValidNpc(test), TRUE);

    // Force trigger weapon refresh
    const int oCNpc__Enable = 6955008; //0x6A2000
    CALL_PtrParam(_@(test.bbox3D_maxs));
    CALL__thiscall(_@(test), oCNpc__Enable);

    // Check equipped weapon
    var int hasWeap; hasWeap = Npc_HasEquippedWeapon(test);
    Wld_RemoveNpc(G1CP_Test_0192_Npc);
    G1CP_Testsuite_Assert(hasWeap, FALSE);
};
