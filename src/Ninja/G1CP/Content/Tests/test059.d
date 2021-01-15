/*
 * #59 Vendors equip strongest weapon
 *
 * A test NPC is inserted with a scythe equipped (weak weapon) and Thorus's sword in the inventory (strong weapon).
 *
 * Expected behavior: The NPC still has the scythe equipped.
 */
instance Ninja_G1CP_Test_059_Npc(C_Npc) {
    name         = "Test 59";
    attribute[0] = 2;
    attribute[1] = 2;
    attribute[4] = 1000; // Enough strength to carry any weapon
    Mdl_SetVisual(self, "HUMANS.MDS");
    CreateInvItem(self, MEM_FindParserSymbol("Thorus_Schwert"));
    EquipItem(self, MEM_FindParserSymbol("ItMw_1H_Scythe_01"));
};
func int Ninja_G1CP_Test_059() {
    // Insert test NPC
    var string wp; wp = Npc_GetNearestWP(hero);
    Wld_InsertNpc(Ninja_G1CP_Test_059_Npc, wp);
    var zCVob test; test = Hlp_GetNpc(Ninja_G1CP_Test_059_Npc);
    if (!Hlp_IsValidNpc(test)) {
        Ninja_G1CP_TestsuiteErrorDetail(59, "Failed to insert NPC");
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
    Wld_RemoveNpc(Ninja_G1CP_Test_059_Npc);

    // Check if weapon matches
    if (weapId != MEM_FindParserSymbol("ItMw_1H_Scythe_01")) {
        var string weapName;
        if (Hlp_IsValidItem(weap)) {
            weapName = weap.name;
        } else {
            weapName = "None";
        };
        Ninja_G1CP_TestsuiteErrorDetail(59, ConcatStrings("Incorrect weapon equipped: ", weapName));
        return FALSE;
    };

    // Otherwise successful
    return TRUE;
};
