/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 */
func int G1CP_111_JackalProtectionMoneyPay() {
    if (G1CP_IsFunc("Info_Jackal_Hello_Pay", "void|none"))
    && (G1CP_IsIntVar("Jackal_ProtectionPaid", 0))
    && (G1CP_IsItemInst("ItMiNugget")) {
        HookDaedalusFuncS("Info_Jackal_Hello_Pay", "G1CP_111_JackalProtectionMoneyPay_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_111_JackalProtectionMoneyPay_Hook() {
    G1CP_ReportFuncToSpy();

    // Symbol indices (existence confirmed by function above)
    var int oreId; oreId = MEM_GetSymbolIndex("ItMiNugget");
    var int paidId; paidId = MEM_GetSymbolIndex("Jackal_ProtectionPaid");

    // Status before
    var int amountOreBefore; amountOreBefore = Npc_HasItems(hero, oreId);
    var int paidStatusBefore; paidStatusBefore = G1CP_GetIntVarI(paidId, 0, 0);

    // Continue with the original function
    ContinueCall();

    // Check if the variable was changed to successful, but no ore was deduced
    var int paidStatusAfter; paidStatusAfter = G1CP_GetIntVarI(paidId, 0, 0);
    if (paidStatusAfter) && (paidStatusAfter != paidStatusBefore)
    && (Npc_HasItems(hero, oreId) == amountOreBefore) {
        G1CP_GiveInvItems(hero, self, oreId, 10);
    };
};
