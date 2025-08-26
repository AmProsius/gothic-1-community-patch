/*
 * #192 Mages auto-equip melee/ranged weapons
 *
 * A test NPC (magic user) is inserted without any weapon equipped but Thorus's sword in the inventory (strong weapon).
 *
 * Expected behavior: The NPC does not auto-equip the weapon.
 */
instance G1CP_Test_0192_Npc(C_Npc) {
    name         = "Test 192";
    attribute[0] = 2;
    attribute[1] = 2;
    attribute[4] = 1000; // Enough strength to carry any weapon
    fight_tactic = 25;   // FAI_HUMAN_MAGE
    Mdl_SetVisual(self, "HUMANS.MDS");
    CreateInvItem(self, MEM_GetSymbolIndex("Thorus_Schwert"));
};
func int G1CP_Test_0192() {
    G1CP_Testsuite_CheckItem("Thorus_Schwert");

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWp(hero);
    Wld_InsertNpc(G1CP_Test_0192_Npc, wp);
    var zCVob test; test = Hlp_GetNpc(G1CP_Test_0192_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return FALSE;
    };

    // Force trigger weapon refresh
    const int oCNpc__Enable = 6955008; //0x6A2000
    CALL_PtrParam(_@(test.bbox3D_maxs));
    CALL__thiscall(_@(test), oCNpc__Enable);

    // Check equipped weapon
    var int hasWeap; hasWeap = Npc_HasEquippedWeapon(test);

    // Remove NPC
    Wld_RemoveNpc(G1CP_Test_0192_Npc);

    // Check if weapon matches
    if (hasWeap) {
        G1CP_TestsuiteErrorDetail("NPC equipped the weapon");
        return FALSE;
    };

    // Otherwise successful
    return TRUE;
};
