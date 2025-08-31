/*
 * #241 The player can become a guard after passing the fire mage trial
 *
 * A few values are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0241() {
    const int GIL_STT = 0; GIL_STT = G1CP_Testsuite_GetIntConst("GIL_STT");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("GRD_200_Thorus_GARDIST_Condition");
    var int logId; logId = G1CP_Testsuite_CheckIntVar("CorKalom_BringMCQBalls");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("GRD_200_Thorus_WANNABEMAGE");
    var int kdfId; kdfId = G1CP_Testsuite_CheckIntVar("Corristo_KDFAufnahme");
    const int LOG_SUCCESS = 2;

    G1CP_Testsuite_BackupInt(logId, 0);
    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupInt(kdfId, 0);

    G1CP_SetIntVarI(logId, 0, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_STT);
    G1CP_SetInfoToldI(infoId, FALSE);
    G1CP_SetIntVarI(kdfId, 0, 4);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
