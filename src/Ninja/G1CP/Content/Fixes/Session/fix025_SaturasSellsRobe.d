/*
 * #25 Saturas sells High Robe twice
 */
func int G1CP_025_SaturasSellsRobe() {
    if (G1CP_IsFunc("KDW_600_Saturas_HEAVYARMOR_Condition", "int|none"))
    && (G1CP_IsItemInst("KDW_ARMOR_H")) {
        HookDaedalusFuncS("KDW_600_Saturas_HEAVYARMOR_Condition", "G1CP_025_SaturasSellsRobe_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_025_SaturasSellsRobe_Hook() {
    G1CP_ReportFuncToSpy();

    // Obtain symbol
    var int symbId; symbId = MEM_GetSymbolIndex("KDW_ARMOR_H");
    if (symbId != -1) {
        if (Npc_HasItems(hero, symbId)) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};
