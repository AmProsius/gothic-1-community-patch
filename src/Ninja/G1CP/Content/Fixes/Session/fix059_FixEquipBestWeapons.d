/*
 * Intercept default equipping of best ranged and melee weapons of NPCs. Best weapons will now only be equipped if no
 * weapon of respective type is not already equipped. This will prevent trading NPCs to block the best weapon.
 * Source: https://forum.worldofplayers.de/forum/threads/?p=25954713
 *
 * - Requires Ikarus, LeGo (HookEngine)
 * - Compatible with Gothic 1 and Gothic 2
 *
 * Call FixEquipBestWeapons_Init from Init_Global.
 */
func void FixEquipBestWeapons_Init() {
    const int once = 0;
    if (!once) {
        MEM_InitAll();

        const int oCNpc__Enable_equipBestWeapons_G1 = 6955616; //0x6A2260
        const int oCNpc__Enable_equipBestWeapons_G2 = 7626662; //0x745FA6
        var int addr; addr = MEMINT_SwitchG1G2(oCNpc__Enable_equipBestWeapons_G1, oCNpc__Enable_equipBestWeapons_G2);

        // Remove default equipping of best melee and ranged weapon to add more conditions
        const int nop20Bytes[5] = { -1869574000, -1869574000, -1869574000, -1869574000, -1869574000 }; //0x90 * 20
        MemoryProtectionOverride(addr, 18);
        MEM_CopyBytes(_@(nop20Bytes), addr, 18);

        HookEngineF(addr, 5, _FixEquipBestWeapons);

        once = 1;
    };
};

func void NpcEquipBestWeaponByType(var C_Npc npc, var int type) {
    const int oCNpc__EquipBestWeapon_G1 = 6988320; //0x6AA220
    const int oCNpc__EquipBestWeapon_G2 = 7663408; //0x74EF30
    var int npcPtr; npcPtr = _@(npc);
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(type));
        CALL__thiscall(_@(npcPtr), MEMINT_SwitchG1G2(oCNpc__EquipBestWeapon_G1, oCNpc__EquipBestWeapon_G2));
        call = CALL_End();
    };
};

func void _FixEquipBestWeapons() {
    var C_Npc npc; npc = _^(ESI);

    if (!Npc_HasEquippedMeleeWeapon(npc))
    && (!Npc_HasReadiedMeleeWeapon(npc)) {
        NpcEquipBestWeaponByType(npc, ITEM_KAT_NF);
    };

    if (!Npc_HasEquippedRangedWeapon(npc))
    && (!Npc_HasReadiedRangedWeapon(npc)) {
        NpcEquipBestWeaponByType(npc, ITEM_KAT_FF);
    };
};
