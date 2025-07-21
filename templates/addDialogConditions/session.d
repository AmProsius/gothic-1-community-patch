/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string conditionName = "### TODO: Dialog condition name ###";
    /* ### TODO: Optional: Add conditions for the fix to be applied ### */
    if (!G1CP_IsFunc(conditionName, "int|none")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionName, "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func void G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook() {
    G1CP_ReportFuncToSpy();

    /* ### TODO: Write the fix ### */

    ContinueCall();
};
