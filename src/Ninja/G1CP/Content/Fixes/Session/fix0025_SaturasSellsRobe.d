/*
 * #25 Saturas sells High Robe twice
 */
func int G1CP_0025_SaturasSellsRobe() {
    const string conditionFuncName = "KDW_600_Saturas_HEAVYARMOR_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsItemInst("KDW_ARMOR_H")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0025_SaturasSellsRobe_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0025_SaturasSellsRobe_Hook() {
    G1CP_ReportFuncToSpy();

    if (Npc_HasItems(hero, MEM_GetSymbolIndex("KDW_ARMOR_H"))) {
        return FALSE;
    };

    ContinueCall();
};
