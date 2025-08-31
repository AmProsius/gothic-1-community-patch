/*
 * #40 Aleph's key dialog doesn't disappear
 *
 * The necessary dialogs including the one from the new condition are set to told and the dialog function is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0040() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("VLK_585_Aleph_DIRTY_Condition");
    var int ulbertId; ulbertId = G1CP_Testsuite_CheckInfo("GRD_271_ULBERT_DRUNK");
    var int brandickId; brandickId = G1CP_Testsuite_CheckInfo("GRD_261_Brandick_ALEPH");
    var int alephId; alephId = G1CP_Testsuite_CheckInfo("VLK_585_Aleph_SCHUPPEN");

    G1CP_Testsuite_BackupTold(ulbertId);
    G1CP_Testsuite_BackupTold(brandickId);
    G1CP_Testsuite_BackupTold(alephId);

    G1CP_SetInfoToldI(ulbertId, TRUE);
    G1CP_SetInfoToldI(brandickId, TRUE);
    G1CP_SetInfoToldI(alephId, TRUE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
