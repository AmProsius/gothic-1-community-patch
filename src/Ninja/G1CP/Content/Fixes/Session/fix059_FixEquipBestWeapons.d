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
func void Ninja_G1CP_059_FixEquipBestWeapons() {
    MEM_InitAll();

    const int oCNpc__Enable_equipBestWeapons = 6955616; //0x6A2260

    // Extra layer for compatibility
    if (MEM_ReadInt(oCNpc__Enable_equipBestWeapons) == /*6A 02 8B CE*/3465216618)
    && (!IsHooked(oCNpc__Enable_equipBestWeapons)) {
        // Remove default equipping of best melee and ranged weapon to add more conditions
        const int nop20Bytes[5] = {-1869574000, -1869574000, -1869574000, -1869574000, -1869574000}; //0x90 * 20
        MemoryProtectionOverride(oCNpc__Enable_equipBestWeapons, 18);
        MEM_CopyBytes(_@(nop20Bytes), oCNpc__Enable_equipBestWeapons, 18);
        HookEngineF(oCNpc__Enable_equipBestWeapons, 5, Ninja_G1CP_FixEquipBestWeapons);
        MEM_Info("G1CP: Fix #59");
    };
};

func void Ninja_G1CP_NpcEquipBestWeaponByType(var C_Npc npc, var int type) {
    const int oCNpc__EquipBestWeapon = 6988320; //0x6AA220
    var int npcPtr; npcPtr = _@(npc);
    const int call = 0;
    if (CALL_Begin(call)) {
        CALL_IntParam(_@(type));
        CALL__thiscall(_@(npcPtr), oCNpc__EquipBestWeapon);
        call = CALL_End();
    };
};

func void Ninja_G1CP_FixEquipBestWeapons() {
    var C_Npc npc; npc = _^(ESI);

    if (!Npc_HasEquippedMeleeWeapon(npc))
    && (!Npc_HasReadiedMeleeWeapon(npc)) {
        Ninja_G1CP_NpcEquipBestWeaponByType(npc, /*ITEM_KAT_NF*/2);
    };

    if (!Npc_HasEquippedRangedWeapon(npc))
    && (!Npc_HasReadiedRangedWeapon(npc)) {
        Ninja_G1CP_NpcEquipBestWeaponByType(npc, /*ITEM_KAT_FF*/4);
    };
};
