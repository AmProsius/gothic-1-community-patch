/*
 * #241 The player can become a guard after passing the fire mage trial
 */
func int G1CP_241_GuardAfterTrial() {
    if (G1CP_IsFunc("GRD_200_Thorus_GARDIST_Condition", "int|none"))
    && (G1CP_IsIntVar("Corristo_KDFAufnahme", 0)) {
        HookDaedalusFuncS("GRD_200_Thorus_GARDIST_Condition", "G1CP_241_GuardAfterTrial_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_241_GuardAfterTrial_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("Corristo_KDFAufnahme", 0, 0) >= 4) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
