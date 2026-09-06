/*
 * #102 The player doesn't lose ore when paying for Jesse
 */
func int G1CP_0102_JesseProtectionMoneyPay() {
    const string dialogFuncName = "Info_Bloodwyn_PayForJesse_Info";
    if (!G1CP_IsFunc(dialogFuncName, "void|none"))
    || (!G1CP_IsIntVar("Jesse_PayForMe"))
    || (!G1CP_IsItemInst("ItMiNugget")) {
        return FALSE;
    };

    HookDaedalusFuncS(dialogFuncName, "G1CP_0102_JesseProtectionMoneyPay_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog to introduce more actions
 */
func void G1CP_0102_JesseProtectionMoneyPay_Hook() {
    G1CP_ReportFuncToSpy();

    const int LOG_SUCCESS = 2;
    var int itemId; itemId = MEM_GetSymbolIndex("ItMiNugget");
    var int questId; questId = MEM_GetSymbolIndex("Jesse_PayForMe");
    var int itemAmountBefore; itemAmountBefore = Npc_HasItems(hero, itemId);
    var int topicStatusBefore; topicStatusBefore = G1CP_GetIntVarI(questId, 0, LOG_SUCCESS);

    ContinueCall();

    var int topicStatusAfter; topicStatusAfter = G1CP_GetIntVarI(questId, 0, LOG_SUCCESS);
    if (Npc_HasItems(hero, itemId) == itemAmountBefore)
    && (topicStatusAfter == LOG_SUCCESS) && (topicStatusAfter != topicStatusBefore) {
        G1CP_GiveInvItems(hero, self, itemId, 10);
    };
};
