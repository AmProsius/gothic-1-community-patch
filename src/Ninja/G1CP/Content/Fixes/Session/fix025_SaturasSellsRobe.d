/*
 * #25 Saturas sells High Robe twice
 */
func int G1CP_025_SaturasSellsRobe() {
    if (MEM_GetSymbolIndex("KDW_600_Saturas_HEAVYARMOR_Condition") != -1)
    && (MEM_GetSymbolIndex("KDW_ARMOR_H") != -1) {
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
