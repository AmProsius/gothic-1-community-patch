/*
 * #38 Snaf's Nek dialog disappears
 */
func void G1CP_Test_0038() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Snaf_WhereNek_Condition");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Snaf_Zutaten");
    const int LOG_SUCCESS = 2;

    G1CP_Testsuite_BackupInt(varId, 0);

    G1CP_SetIntVarI(varId, 0, LOG_SUCCESS);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
};
