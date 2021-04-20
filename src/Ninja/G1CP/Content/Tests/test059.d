/*
 * #59 Vendors equip strongest weapon
 *
 * A test NPC is inserted with a scythe equipped (weak weapon) and Thorus's sword in the inventory (strong weapon).
 *
 * Expected behavior: The NPC still has the scythe equipped.
 */
instance G1CP_Test_059_Npc(C_Npc) {
    name         = "Test 59";
    attribute[0] = 2;
    attribute[1] = 2;
    attribute[4] = 1000; // Enough strength to carry any weapon
    Mdl_SetVisual(self, "HUMANS.MDS");
    CreateInvItem(self, MEM_GetSymbolIndex("Thorus_Schwert"));
    EquipItem(self, MEM_GetSymbolIndex("ItMw_1H_Scythe_01"));
};
func int G1CP_Test_059() {
    G1CP_Testsuite_CheckItem("Thorus_Schwert");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMw_1H_Scythe_01");
    G1CP_Testsuite_CheckPassed();

    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(G1CP_Test_059_Npc, wp);
    var zCVob test; test = Hlp_GetNpc(G1CP_Test_059_Npc);
    if (!Hlp_IsValidNpc(test)) {
        G1CP_TestsuiteErrorDetail("Failed to insert NPC");
        return FALSE;
    };

    // Force trigger weapon refresh
    const int oCNpc__Enable = 6955008; //0x6A2000
    CALL_PtrParam(_@(test.bbox3D_maxs));
    CALL__thiscall(_@(test), oCNpc__Enable);

    // Check equipped weapon
    var C_Item weap; weap = Npc_GetEquippedMeleeWeapon(test);
    var int weapId; weapId = Hlp_GetInstanceId(weap);

    // Remove NPC
    Wld_RemoveNpc(G1CP_Test_059_Npc);

    // Check if weapon matches
    if (weapId != itemId) {
        var string weapName;
        if (Hlp_IsValidItem(weap)) {
            weapName = weap.name;
        } else {
            weapName = "None";
        };
        G1CP_TestsuiteErrorDetail(ConcatStrings("Incorrect weapon equipped: ", weapName));
        return FALSE;
    };

    // Otherwise successful
    return TRUE;
};
