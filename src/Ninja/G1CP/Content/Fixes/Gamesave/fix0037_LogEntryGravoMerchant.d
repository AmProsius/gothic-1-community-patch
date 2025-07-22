/*
 * #37 Gravo not listed as merchant
 */

/*
 * Since applying and reverting both depend on finding the necessary symbols this is a toggle function
 */
func int G1CP_0037_LogEntryGravoMerchant_Toggle(var int apply) {
    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    return G1CP_LogCreateTopicInDialog(LOG_NOTE, "GE_TraderOC", "DIA_Gravo_HelpHow", "DIA_Gravo_HelpHow_Info",
        "G1CP_037_LogEntryGravoMerchant_Intercept", apply);
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_0037_LogEntryGravoMerchant_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    G1CP_LogInterceptEntry("GE_TraderOC", topic, LOG_NOTE, entry, 37);
};

/*
 * This function applies the changes
 */
func int G1CP_0037_LogEntryGravoMerchant() {
    return G1CP_0037_LogEntryGravoMerchant_Toggle(TRUE);
};

/*
 * This function reverts the changes
 */
func int G1CP_0037_LogEntryGravoMerchantRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(37)) {
        return FALSE;
    };

    return G1CP_0037_LogEntryGravoMerchant_Toggle(FALSE);
};
