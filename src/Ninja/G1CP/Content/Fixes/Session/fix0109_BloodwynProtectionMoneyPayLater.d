/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 */
func int G1CP_0109_BloodwynProtectionMoneyPayLater() {
    const string dialogFuncName = "Info_Bloodwyn_PayDay_PayAgain";
    if (!G1CP_IsFunc(dialogFuncName, "void|none"))
    || (!G1CP_IsItemInst("ItMiNugget")) {
        return FALSE;
    };

    HookDaedalusFuncS(dialogFuncName, "G1CP_0109_BloodwynProtectionMoneyPayLater_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_0109_BloodwynProtectionMoneyPayLater_Hook() {
    G1CP_ReportFuncToSpy();

    var int itemId; itemId = MEM_GetSymbolIndex("ItMiNugget");
    var int itemAmountBefore; itemAmountBefore = Npc_HasItems(hero, itemId);

    ContinueCall();

    if (Npc_HasItems(hero, itemId) == itemAmountBefore) {
        G1CP_GiveInvItems(hero, self, itemId, 10);
    };
};
