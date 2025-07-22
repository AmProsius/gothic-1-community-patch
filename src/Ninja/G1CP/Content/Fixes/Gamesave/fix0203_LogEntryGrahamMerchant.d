/*
 * #203 Graham not listed as merchant
 */

/*
 * Since applying and reverting both depend on finding the necessary symbols this is a toggle function
 */
func int G1CP_0203_LogEntryGrahamMerchant_Toggle(var int apply) {
    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    return G1CP_LogCreateTopicInDialog(LOG_NOTE, "GE_TraderOC", "DIA_Graham_Hello", "DIA_Graham_Hello_Info",
        "G1CP_203_LogEntryGrahamMerchant_Intercept", apply);
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_0203_LogEntryGrahamMerchant_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    G1CP_LogInterceptEntry("GE_TraderOC", topic, LOG_NOTE, entry, 203);
};

/*
 * This function applies the changes
 */
func int G1CP_0203_LogEntryGrahamMerchant() {
    return G1CP_0203_LogEntryGrahamMerchant_Toggle(TRUE);
};

/*
 * This function reverts the changes
 */
func int G1CP_0203_LogEntryGrahamMerchantRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(203)) {
        return FALSE;
    };

    return G1CP_0203_LogEntryGrahamMerchant_Toggle(FALSE);
};
