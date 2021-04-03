/*
 * #183 Corristo sells High Robe multiple times
 */
func int G1CP_183_CorristoSellsRobe() {
    if (MEM_GetSymbolIndex("KDF_402_Corristo_HEAVYARMOR_Condition") != -1)
    && (MEM_GetSymbolIndex("KDF_ARMOR_H") != -1) {
        HookDaedalusFuncS("KDF_402_Corristo_HEAVYARMOR_Condition", "G1CP_183_CorristoSellsRobe_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_183_CorristoSellsRobe_Hook() {
    G1CP_ReportFuncToSpy();

    // Obtain symbol
    var int symbId; symbId = MEM_GetSymbolIndex("KDF_ARMOR_H");
    if (symbId != -1) {
        if (Npc_HasItems(hero, symbId)) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};
