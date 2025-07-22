/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("### TODO: Dialog condition name ###");
    /* ### TODO: Add additional checks ### */
    G1CP_Testsuite_CheckPassed();

    // Backup values
    /* ### TODO: Backup values ### */
    // Set new values
    /* ### TODO: Set new values ### */

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    /* ### TODO: Restore values ### */

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };

    return TRUE;
};
