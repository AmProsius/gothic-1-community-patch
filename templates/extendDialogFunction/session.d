/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    const string infoName = "### TODO: Info name ###";
    // ### TODO: Optional: Add conditions for the fix to be applied ###
    if (!G1CP_IsFunc(infoName, "void|none")) {
        return FALSE
    }

    HookDaedalusFuncS(infoName, "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog function
 */
func void G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Hook() {
    G1CP_ReportFuncToSpy();

    // ### TODO: Optional: Backup values and/or define possibly missing symbols locally ###

    // Continue with the original function
    ContinueCall();

    // ### TODO: Write the fix ###
};
