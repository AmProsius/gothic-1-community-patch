/*
 * #25 Saturas sells High Robe twice
 */
func void Ninja_G1CP_025_SaturasSellsRobe() {
    HookDaedalusFuncS("KDW_600_Saturas_HEAVYARMOR_Condition", "Ninja_G1CP_025_SaturasSellsRobe_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_025_SaturasSellsRobe_Hook() {
    // Obtain symbol
    var int symbId; symbId = MEM_FindParserSymbol("KDW_ARMOR_H");
    if (symbId != -1) {
        if (Npc_HasItems(hero, symbId)) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};
