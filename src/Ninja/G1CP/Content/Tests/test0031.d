/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 *
 * A required dialog is set to 'told' and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0031() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Wolf_MCPLATESFEW_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Info_Wolf_MCPLATESENOUGH");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Knows_GetMCPlates");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItAt_Crawler_02");

    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupInt(varId, 0);
    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    G1CP_SetInfoToldI(infoId, TRUE);
    G1CP_SetIntVarI(varId, 0, TRUE);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 1); // Too few plates

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
