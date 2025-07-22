/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}() {
    /* ### TODO: Write the fix and adjust the return value ### */
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied({ISSUE_NUM})) {
        return FALSE;
    };

    /* ### TODO: Write the fix reversal and adjust the return value ###
     * Mind that the check above may not be necessary/desired depending on the fix */
    return FALSE;
};
