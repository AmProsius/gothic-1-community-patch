/*
 * #220 Gor Na Ran attacks the player character in chapter 6
 *
 * Expected behavior: Gor Na Ran no longer talks to and attacks the player.
 */
func void G1CP_Test_0220() {
    var int chptId; chptId = G1CP_Testsuite_CheckIntVar("Kapitel");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_TPL_1405_GorNaRan_Condition");

    G1CP_Testsuite_BackupInt(chptId, 0);

    G1CP_SetIntVarI(chptId, 0, 6);
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
