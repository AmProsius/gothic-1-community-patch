/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 */
func int G1CP_109_BloodwynProtectionMoneyPayLater() {
    if (G1CP_IsFunc("Info_Bloodwyn_PayDay_PayAgain", "void|none"))
    && (G1CP_IsItemInst("ItMiNugget")) {
        HookDaedalusFuncS("Info_Bloodwyn_PayDay_PayAgain", "G1CP_109_BloodwynProtectionMoneyPayLater_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_109_BloodwynProtectionMoneyPayLater_Hook() {
    G1CP_ReportFuncToSpy();

    // Remember how much ore the player has before the dialog
    var int amountOreBefore;
    var int oreId; oreId = MEM_GetSymbolIndex("ItMiNugget");
    if (oreId != -1) {
        amountOreBefore = Npc_HasItems(hero, oreId);
    };

    // Continue with the original function
    ContinueCall();

    // Check if no ore was deduced
    if (oreId != -1) {
        if (Npc_HasItems(hero, oreId) == amountOreBefore) {
            G1CP_GiveInvItems(hero, self, oreId, 10);
        };
    };
};
