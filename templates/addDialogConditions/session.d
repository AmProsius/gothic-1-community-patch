/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string conditionFuncName = "### TODO Dialog condition function name ###";

    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    /*### TODO || (!G1CP_IsIntVar("other_requirements")) ###*/{
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new conditions (other conditions remain untouched)
    if (/*### TODO Add conditions that should prevent the dialog ###*/FALSE) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
