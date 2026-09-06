/*
 * #28 Mordrag doesn't refuse to escort the player
 */
func int G1CP_0028_MordragNoEscort() {
    const string conditionFuncName = "Org_826_Mordrag_GotoNewcamp_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntVar("MordragKO_HauAb")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0028_MordragNoEscort_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0028_MordragNoEscort_Hook() {
    G1CP_ReportFuncToSpy();

    if (G1CP_GetIntVar("MordragKO_HauAb", FALSE) == TRUE) {
        return FALSE;
    };

    ContinueCall();
};
