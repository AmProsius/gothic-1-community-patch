/*
 * #28 Mordrag doesn't refuse to escort the player
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_028() {
    // Define constants for specific test
    const string INFO_NAME = "Org_826_Mordrag_JoinNewcamp";
    const string VAR_NAME  = "MordragKO_HauAb";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId("Org_826_Mordrag_GotoNewcamp_Condition");
    var int infoId; infoId = G1CP_Testsuite_GetInfoId(INFO_NAME);
    G1CP_Testsuite_CheckIntVar(VAR_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int   toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int   varBak;  varBak  = G1CP_GetIntVar(VAR_NAME, 0, 0);
    var C_Npc slfBak;  slfBak  = MEM_CpyInst(self);
    var C_Npc othBak;  othBak  = MEM_CpyInst(other);

    // Set new values
    G1CP_SetInfoTold(INFO_NAME, TRUE);
    G1CP_SetIntVar(VAR_NAME, 0, TRUE);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetInfoTold(INFO_NAME, toldBak);
    G1CP_SetIntVar(VAR_NAME, 0, varBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
