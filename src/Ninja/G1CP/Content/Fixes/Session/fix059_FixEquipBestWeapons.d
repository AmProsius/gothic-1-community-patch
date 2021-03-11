/*
 * #59 Vendors equip strongest weapon
 *
 * Intercept default equipping of best ranged and melee weapons of NPCs. Best weapons will now only be equipped if no
 * weapon of respective type is not already equipped. This will prevent trading NPCs to block the best weapon.
 * Source: https://forum.worldofplayers.de/forum/threads/?p=25954713
 */
func int G1CP_059_FixEquipBestWeapons() {
    const int oCNpc__Enable_equipBestWeapons = 6955616; //0x6A2260
    const string orig1 = "6A 02 8B CE E8 B7 7F 00 00 6A 04 8B CE E8 AE 7F 00 00"; // Original
    const string orig2 = "6A 02 8B CE E8 B7 7F 00 00 6A 04 8B CE E8 7E 64 F0 FF"; // 3rd party fix

    if (G1CP_CheckBytes(oCNpc__Enable_equipBestWeapons, orig1) == 1) // 1 == cannot be hooked
    || (G1CP_CheckBytes(oCNpc__Enable_equipBestWeapons, orig2) == 1) {
        // Remove default equipping of best melee and ranged weapon to add more conditions
        const int nop20Bytes[5] = {-1869574000, -1869574000, -1869574000, -1869574000, -1869574000}; //0x90 * 20
        MemoryProtectionOverride(oCNpc__Enable_equipBestWeapons, 18);
        MEM_CopyBytes(_@(nop20Bytes), oCNpc__Enable_equipBestWeapons, 18);
        HookEngineF(oCNpc__Enable_equipBestWeapons, 5, G1CP_059_FixEquipBestWeapons_Hook);

        return TRUE;
    } else {
        return FALSE;
    };
};

func void G1CP_NpcEquipBestWeaponByType(var C_Npc npc, var int type) {
    const int oCNpc__EquipBestWeapon = 6988320; //0x6AA220
    var int npcPtr; npcPtr = _@(npc);
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(type));
        CALL__thiscall(_@(npcPtr), oCNpc__EquipBestWeapon);
        call = CALL_End();
    };
};

func void G1CP_059_FixEquipBestWeapons_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int ITEM_KAT_NF = 2;
    const int ITEM_KAT_FF = 4;

    var C_Npc npc; npc = _^(ESI);

    if (!Npc_HasEquippedMeleeWeapon(npc))
    && (!Npc_HasReadiedMeleeWeapon(npc)) {
        G1CP_NpcEquipBestWeaponByType(npc, ITEM_KAT_NF);
    };

    if (!Npc_HasEquippedRangedWeapon(npc))
    && (!Npc_HasReadiedRangedWeapon(npc)) {
        G1CP_NpcEquipBestWeaponByType(npc, ITEM_KAT_FF);
    };
};
