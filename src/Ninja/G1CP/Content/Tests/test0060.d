/*
 * #60 Jesse's quest not available
 *
 * The required dialog is set to told and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func void G1CP_Test_0060() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Jesse_Mission_Condition");
    var int warnId; warnId = G1CP_Testsuite_CheckInfo("DIA_Jesse_Warn");
    var int missionId; missionId = G1CP_Testsuite_CheckInfo("DIA_Jesse_Mission");

    G1CP_Testsuite_BackupTold(warnId);
    G1CP_Testsuite_BackupTold(missionId);

    G1CP_SetInfoToldI(warnId, TRUE);
    G1CP_SetInfoToldI(missionId, FALSE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
};
