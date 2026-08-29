/*
 * #@ISSUE_NUM@ @LONGNAME@
 */

func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Toggle(var int apply) {
    const int TOPIC_SECTION = /*### TODO Topic section constant ###*/0;
    return G1CP_LogCreateTopicInDialog(
        TOPIC_SECTION,
        "### TODO Topic name ###",
        "### TODO Info instance name ###",
        "### TODO Info function name ###",
        "G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Intercept",
        apply
    );
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_037_LogEntryGravoMerchant_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();
    const int TOPIC_SECTION = /*### TODO Topic section constant ###*/0;
    G1CP_LogInterceptEntry("### TODO Topic name ###", topic, TOPIC_SECTION, entry, @ISSUE_NUM@);
};

/*
 * Apply the fix
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@() {
    return G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Toggle(TRUE);
};

/*
 * Revert the changes
 */
func int G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@Revert() {
    if (!G1CP_IsFixApplied(@ISSUE_NUM@)) {
        return FALSE;
    };

    return G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_Toggle(FALSE);
};
