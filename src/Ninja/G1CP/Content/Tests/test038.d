/*
 * #38 Snaf's Nek dialog disappears
 *
 * The quest "Snaf's Recipe" is set to successful and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int G1CP_Test_038() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Snaf_WhereNek_Condition");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Snaf_Zutaten", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Backup values
    var int varBak; varBak = G1CP_GetIntVarI(varId, 0, 0);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetIntVarI(varId, 0, LOG_SUCCESS);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetIntVarI(varId, 0, varBak);

    // Check return value
    if (ret) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };
};
