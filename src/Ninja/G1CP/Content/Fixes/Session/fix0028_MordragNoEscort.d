/*
 * #28 Mordrag doesn't refuse to escort the player
 */
func int G1CP_0028_MordragNoEscort() {
    if (G1CP_IsFunc("Org_826_Mordrag_GotoNewcamp_Condition", "int|none"))
    && (G1CP_IsIntVar("MordragKO_HauAb", 0)) {
        HookDaedalusFuncS("Org_826_Mordrag_GotoNewcamp_Condition", "G1CP_0028_MordragNoEscort_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0028_MordragNoEscort_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("MordragKO_HauAb", 0, FALSE) == TRUE) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
