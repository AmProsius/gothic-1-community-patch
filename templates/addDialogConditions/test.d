/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func void G1CP_Test_{ISSUE_NUM_PAD}() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("### TODO Dialog condition function name ###");
    // ### TODO Add additional checks ###

    // ### TODO Backup variable values ###

    // ### TODO Set variable values ###

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
