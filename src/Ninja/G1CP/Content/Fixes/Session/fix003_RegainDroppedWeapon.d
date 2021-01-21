/*
 * #3 NPCs don't collect weapons after fight
 *
 * The following issues are addressed:
 *  - The NPC now correctly picks up the detected item, even if they have to turn around
 *  - The NPC now only picks up a weapon if they don't already have one of the type equipped
 *  - The NPC now no longer equips the best weapon, but the one that was picked up (complementing #59)
 *
 * This fix requires LeGo AI-Functions.
 */
func void Ninja_G1CP_003_RegainDroppedWeapon() {
    HookDaedalusFuncS("B_RegainDroppedWeapon", "Ninja_G1CP_003_RegainDroppedWeapon_Hook");
};

/*
 * This function essentially replaces (not technically!) the function 'B_RegainDroppedWeapon'
 */
func void Ninja_G1CP_003_RegainDroppedWeapon_Logic(var C_Npc slf) {
    Npc_PerceiveAll(slf);

    // Define possibly missing symbols locally
    const int ITEM_KAT_NF  = 1<<1;
    const int ITEM_KAT_FF  = 1<<2;
    const int ITEM_KAT_MUN = 1<<3;

    // Melee weapon
    if (Wld_DetectItem(slf, ITEM_KAT_NF)) {
        if (Npc_GetDistToItem(slf, item) < 5000)         // Prevent walking off too far
        && (Ninja_G1CP_Npc_CanSeeItemFreeLOS(slf, item)) // Does not have to face it, only line of sight
        && (!Npc_HasEquippedMeleeWeapon(slf)) {
            AI_TakeItem(slf, item);
            AI_Function_NI(slf, EquipWeapon, slf, Hlp_GetInstanceID(item)); // Equip this exact weapon in particular
        };
    };

    // Ranged weapon
    if (Wld_DetectItem(slf, ITEM_KAT_FF)) {
        if (Npc_GetDistToItem(slf, item) < 5000)
        && (Ninja_G1CP_Npc_CanSeeItemFreeLOS(slf, item))
        && (!Npc_HasEquippedRangedWeapon(slf)) {
            AI_TakeItem(slf, item);
            AI_Function_NI(slf, EquipWeapon, slf, Hlp_GetInstanceID(item));
        };
    };

    // Ammunition (just a bonus)
    if (Wld_DetectItem(slf, ITEM_KAT_MUN)) {
        if (Npc_GetDistToItem(slf, item) < 5000)
        && (Ninja_G1CP_Npc_CanSeeItemFreeLOS(slf, item)) {
            AI_TakeItem(slf, item);
        };
    };
};

/*
 * This function disables part of the external function calls of the original function
 */
func void Ninja_G1CP_003_RegainDroppedWeapon_Hook(var C_Npc slf) {
    // Extra sugar: Back up the global symbol
    var int itemBak; itemBak = _@(item);

    // Temporarily disable AI_TakeItem, AI_EquipBestRangedWeapon and AI_EquipBestMeleeWeapon
    const int AI_TakeItem_p              = 6660155; //0x65A03B
    const int AI_EquipBestMeleeWeapon_p  = 6654871; //0x658B97
    const int AI_EquipBestRangedWeapon_p = 6655079; //0x658C67
    const int once = 0;
    if (!once) {
        MemoryProtectionOverride(AI_TakeItem_p, 4);
        MemoryProtectionOverride(AI_EquipBestMeleeWeapon_p, 4);
        MemoryProtectionOverride(AI_EquipBestRangedWeapon_p, 4);
        once = 1;
    };
    const int orig = 3296983179; /*8B F8 83 C4*/
    const int newb = 3296984881; /*31 FF 83 C4*/
    if (MEM_ReadInt(AI_TakeItem_p)              == orig) { MEM_WriteInt(AI_TakeItem_p,              newb); };
    if (MEM_ReadInt(AI_EquipBestMeleeWeapon_p)  == orig) { MEM_WriteInt(AI_EquipBestMeleeWeapon_p,  newb); };
    if (MEM_ReadInt(AI_EquipBestRangedWeapon_p) == orig) { MEM_WriteInt(AI_EquipBestRangedWeapon_p, newb); };

    // Call the original function (There might be other important changes that we do not want to overwrite!)
    PassArgumentN(slf);
    ContinueCall();

    // Re-enable the engine functions
    if (MEM_ReadInt(AI_TakeItem_p)              == newb) { MEM_WriteInt(AI_TakeItem_p,              orig); };
    if (MEM_ReadInt(AI_EquipBestMeleeWeapon_p)  == newb) { MEM_WriteInt(AI_EquipBestMeleeWeapon_p,  orig); };
    if (MEM_ReadInt(AI_EquipBestRangedWeapon_p) == newb) { MEM_WriteInt(AI_EquipBestRangedWeapon_p, orig); };

    // And now, we do it our way
    Ninja_G1CP_003_RegainDroppedWeapon_Logic(slf);

    // Finally re-instate the global symbol
    MEM_AssignInstSuppressNullWarning = TRUE;
    item = _^(itemBak);
    MEM_AssignInstSuppressNullWarning = FALSE;
};
