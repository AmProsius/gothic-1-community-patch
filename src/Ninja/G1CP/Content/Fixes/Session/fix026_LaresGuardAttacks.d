/*
 * #26 Lares's guard doesn't attack the player
 */
func int G1CP_026_LaresGuardAttacks() {
    if (MEM_GetSymbolIndex("Info_Org_804_FirstWarn_Condition")  != -1)
    && (MEM_GetSymbolIndex("AIV_GUARDPASSAGE_STATUS")           != -1) {
        HookDaedalusFuncS("Info_Org_804_FirstWarn_Condition", "G1CP_026_LaresGuardAttacks_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_026_LaresGuardAttacks_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", 0)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
