/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    /* ### TODO: Replace dialog condition name of "XXX_Dialog_Condition_Name" ### */
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("XXX_Dialog_Condition_Name");
    /* ### TODO: Optional: Add additional checks ### */

    /* ### TODO: Optional: Backup values ### */
    /* ### TODO: Optional: Set new values ### */

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    /* ### TODO: Optional: Restore values ### */

    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    }

    return TRUE;
}
