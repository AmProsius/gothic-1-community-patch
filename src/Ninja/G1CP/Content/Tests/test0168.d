/*
 * #168 Gor Na Bar offers to become a templar to anyone
 *
 * The player's guild is temporarily removed and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0168() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Tpl_1400_GorNaBar_VICTORY_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItAt_Crawlerqueen");
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");

    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 1);
    Npc_SetTrueGuild(hero, GIL_NONE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
