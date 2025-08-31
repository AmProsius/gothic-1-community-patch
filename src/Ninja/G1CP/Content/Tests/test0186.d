/*
 * #186 Corristo can be asked to join the mages multiple times
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0186() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDF_402_Corristo_WANNBEKDF_Condition");
    var int joinId; joinId = G1CP_Testsuite_CheckIntVar("Corristo_KDFAufnahme");
    var int wannaId; wannaId = G1CP_Testsuite_CheckInfo("GRD_200_Thorus_WANNABEMAGE");
    const int GIL_STT = 0; GIL_STT = G1CP_Testsuite_GetIntConst("GIL_STT");

    G1CP_Testsuite_BackupTold(wannaId);
    G1CP_Testsuite_BackupInt(joinId, 0);
    G1CP_Testsuite_BackupTrueGuild(hero);

    G1CP_SetInfoToldI(wannaId, TRUE);
    Npc_SetTrueGuild(hero, GIL_STT);
    G1CP_SetIntVarI(joinId, 0, TRUE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
