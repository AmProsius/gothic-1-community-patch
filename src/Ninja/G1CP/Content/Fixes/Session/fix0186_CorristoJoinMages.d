/*
 * #186 Corristo can be asked to join the mages multiple times
 */
func int G1CP_0186_CorristoJoinMages() {
    const string conditionFuncName = "KDF_402_Corristo_WANNBEKDF_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntVar("Corristo_KDFAufnahme")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0186_CorristoJoinMages_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0186_CorristoJoinMages_Hook() {
    G1CP_ReportFuncToSpy();

    if (G1CP_GetIntVar("Corristo_KDFAufnahme", FALSE)) {
        return FALSE;
    };

    ContinueCall();
};
