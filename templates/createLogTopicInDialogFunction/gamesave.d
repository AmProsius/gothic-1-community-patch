/*
 * #{ISSUE_NUM} {LONGNAME}
 */

func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Toggle(var int apply) {
    /* ### TODO: Replace topic section constant of TOPIC_SECTION and adjust value ### */
    /* ### TODO: Replace topic name of "XX_TopicName" ### */
    /* ### TODO: Replace info name of "DIA_Info_Name" ### */
    /* ### TODO: Replace info function name of "DIA_Function_Name_Info" ### */

    // Define possibly missing symbols locally
    const int TOPIC_SECTION = 0;

    return G1CP_LogCreateTopicInDialog(TOPIC_SECTION, "XX_TopicName", "DIA_Info_Name", "DIA_Function_Name_Info",
                                       "G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Intercept", apply);
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_037_LogEntryGravoMerchant_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    /* ### TODO: Replace topic section constant of TOPIC_SECTION and adjust value ### */
    // Define possibly missing symbols locally
    const int TOPIC_SECTION = 0;

    /* ### TODO: Replace topic name of "XX_TopicName" ### */
    G1CP_LogInterceptEntry("XX_TopicName", topic, TOPIC_SECTION, entry, {ISSUE_NUM});
}

/*
 * This function applies the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    return G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Toggle(TRUE);
};

/*
 * This function reverts the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    return G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_Toggle(FALSE);
};
