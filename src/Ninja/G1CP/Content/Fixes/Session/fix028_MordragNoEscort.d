/*
 * #28 Mordrag doesn't refuse to escort the player
 */
func int G1CP_028_MordragNoEscort() {
    if (MEM_GetSymbolIndex("Org_826_Mordrag_GotoNewcamp_Condition") != -1)
    && (MEM_GetSymbolIndex("MordragKO_HauAb") != -1) {
        HookDaedalusFuncS("Org_826_Mordrag_GotoNewcamp_Condition", "G1CP_028_MordragNoEscort_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_028_MordragNoEscort_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("MordragKO_HauAb", 0, FALSE) == TRUE) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
