/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 */
func int G1CP_0111_JackalProtectionMoneyPay() {
    const string dialogFuncName = "Info_Jackal_Hello_Pay";
    if (!G1CP_IsFunc(dialogFuncName, "void|none"))
    || (!G1CP_IsItemInst("ItMiNugget"))
    || (!G1CP_IsIntVar("Jackal_ProtectionPaid")) {
        return FALSE;
    };

    HookDaedalusFuncS(dialogFuncName, "G1CP_0111_JackalProtectionMoneyPay_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_0111_JackalProtectionMoneyPay_Hook() {
    G1CP_ReportFuncToSpy();

    var int itemId; itemId = MEM_GetSymbolIndex("ItMiNugget");
    var int paidId; paidId = MEM_GetSymbolIndex("Jackal_ProtectionPaid");
    var int itemAmountBefore; itemAmountBefore = Npc_HasItems(hero, itemId);
    var int paidStatusBefore; paidStatusBefore = G1CP_GetIntVarI(paidId, 0, 0);

    ContinueCall();

    var int paidStatusAfter; paidStatusAfter = G1CP_GetIntVarI(paidId, 0, 0);
    if (Npc_HasItems(hero, itemId) == itemAmountBefore)
    && (paidStatusAfter) && (paidStatusAfter != paidStatusBefore) {
        G1CP_GiveInvItems(hero, self, itemId, 10);
    };
};
