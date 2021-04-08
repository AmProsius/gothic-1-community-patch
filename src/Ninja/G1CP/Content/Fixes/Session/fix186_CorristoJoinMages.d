/*
 * #186 Corristo can be asked to join the mages multiple times
 */
func int G1CP_186_CorristoJoinMages() {
    if (MEM_GetSymbolIndex("KDF_402_Corristo_WANNBEKDF_Condition") != -1)
    && (MEM_GetSymbolIndex("Corristo_KDFAufnahme") != -1) {
        HookDaedalusFuncS("KDF_402_Corristo_WANNBEKDF_Condition", "G1CP_186_CorristoJoinMages_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_186_CorristoJoinMages_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("Corristo_KDFAufnahme", 0, FALSE) == TRUE) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
