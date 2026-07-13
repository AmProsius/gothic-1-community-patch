/*
 * #241 The player can become a guard after passing the fire mage trial
 */
func int G1CP_0241_GuardAfterTrial() {
    const string conditionFuncName = "GRD_200_Thorus_GARDIST_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntVar("Corristo_KDFAufnahme")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0241_GuardAfterTrial_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0241_GuardAfterTrial_Hook() {
    G1CP_ReportFuncToSpy();

    if (G1CP_GetIntVar("Corristo_KDFAufnahme", 0) >= 4) {
        return FALSE;
    };

    ContinueCall();
};
