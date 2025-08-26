/*
 * #220 Gor Na Ran attacks the player character in chapter 6
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Gor Na Ran no longer talks to and attacks the player.
 */
func int G1CP_Test_0220() {
    var int chptId; chptId = G1CP_Testsuite_CheckIntVar("Kapitel");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_TPL_1405_GorNaRan_Condition");

    // Backup values
    var int chapterBak; chapterBak = G1CP_GetIntVarI(chptId, 0, 0);

    // Set new values
    G1CP_SetIntVarI(chptId, 0, 6);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetIntVarI(chptId, 0, chapterBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };

    return TRUE;
};
