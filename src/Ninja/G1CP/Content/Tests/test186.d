/*
 * #186 Corristo can be asked to join the mages multiple times
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_186() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDF_402_Corristo_WANNBEKDF_Condition");
    var int joinId; joinId = G1CP_Testsuite_CheckIntVar("Corristo_KDFAufnahme", 0);
    var int wannaId; wannaId = G1CP_Testsuite_CheckInfo("GRD_200_Thorus_WANNABEMAGE");
    const int GIL_STT = 0; GIL_STT = G1CP_Testsuite_GetIntConst("GIL_STT", 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, wannaId);
    var int kdfAufnahmeBak; kdfAufnahmeBak = G1CP_GetIntVarI(joinId, 0, 0);
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);

    // Set new values
    G1CP_SetInfoToldI(wannaId, TRUE);
    Npc_SetTrueGuild(hero, GIL_STT);
    G1CP_SetIntVarI(joinId, 0, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(wannaId, toldBak);
    Npc_SetTrueGuild(hero, guildBak);
    G1CP_SetIntVarI(joinId, 0, kdfAufnahmeBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
