/*
 * #186 Corristo can be asked to join the mages multiple times
 */
func int G1CP_0186_CorristoJoinMages() {
    if (G1CP_IsFunc("KDF_402_Corristo_WANNBEKDF_Condition", "int|none"))
    && (G1CP_IsIntVar("Corristo_KDFAufnahme")) {
        HookDaedalusFuncS("KDF_402_Corristo_WANNBEKDF_Condition", "G1CP_0186_CorristoJoinMages_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0186_CorristoJoinMages_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("Corristo_KDFAufnahme", FALSE)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
