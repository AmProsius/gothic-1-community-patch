/*
 * #183 Corristo sells High Robe multiple times
 */
func int G1CP_0183_CorristoSellsRobe() {
    const string conditionFuncName = "KDF_402_Corristo_HEAVYARMOR_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsItemInst("KDF_ARMOR_H")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0183_CorristoSellsRobe_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0183_CorristoSellsRobe_Hook() {
    G1CP_ReportFuncToSpy();

    if (Npc_HasItems(hero, MEM_GetSymbolIndex("KDF_ARMOR_H"))) {
        return FALSE;
    };

    ContinueCall();
};
