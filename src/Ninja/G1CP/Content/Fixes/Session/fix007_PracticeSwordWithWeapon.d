/*
 * #7 NPCs practice sword training without a weapon
 */
func int G1CP_007_PracticeSwordWithWeapon() {
    if (MEM_FindParserSymbol("ZS_PracticeSword_Loop") != -1) {
        HookDaedalusFuncS("ZS_PracticeSword_Loop", "G1CP_007_PracticeSwordWithWeapon_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the state loop to draw a weapon if non is readied
 */
func void G1CP_007_PracticeSwordWithWeapon_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int INV_WEAPON  = 1;
    const int ITEM_KAT_NF = 2;

    // Make sure the NPC has a weapon
    if (!Npc_HasReadiedMeleeWeapon(self)) {

        // Check for equipped weapon
        if (Npc_HasEquippedMeleeWeapon(self)) {
            AI_RemoveWeapon(self); // In case of fist mode
            AI_DrawWeapon(self);
        } else {
            // Check if the NPC has a melee weapon in the inventory
            // Explicitly check for a weapon instead of using AI_EquipBestMeleeWeapon to take action if no weapon is
            // available, see below (success == FALSE).

            // Back up the global symbol
            var int itemBak; itemBak = _@(item);

            // Iterate over all six weapon slots (see C_NpcHasWeapon)
            MEM_InitLabels();
            var int success; success = 0;
            repeat(slot, 6); var int slot;
                Npc_GetInvItemBySlot(self, INV_WEAPON, slot);
                if (Hlp_IsValidItem(item)) {
                    if (item.mainflag == ITEM_KAT_NF) {
                        EquipWeapon(self, Hlp_GetInstanceID(item)); // Equip this exact weapon in particular
                        AI_RemoveWeapon(self); // In case of fist mode
                        AI_DrawWeapon(self);
                        success = 1;
                        break;
                    };
                };
            end;

            // Finally re-instate the global symbol
            MEM_AssignInstSuppressNullWarning = TRUE;
            item = _^(itemBak);
            MEM_AssignInstSuppressNullWarning = FALSE;

            // No melee weapon, what now?
            if (!success) {
                var int symbId; symbId = MEM_FindParserSymbol("ZS_StandAround");
                if (symbId != -1) {
                    // AI_StartState(self, symbId, 1, ""); // Does not work, expects func parameter
                    MEM_PushInstParam(self);
                    MEM_PushIntParam(symbId); // Func parameter as integer
                    MEM_PushIntParam(1);
                    MEM_PushStringParam("");
                    MEM_Call(AI_StartState);
                } else {
                    // We tried everything. Go ahead and train with your imaginary weapon!
                };
            };
        };
    };

    // Continue with the original function
    ContinueCall();
};

