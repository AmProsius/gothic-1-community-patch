/*
 * #168 Gor Na Bar offers to become a templar to anyone
 *
 * The player's guild is temporarily removed and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0168() {
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Tpl_1400_GorNaBar_VICTORY_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItAt_Crawlerqueen");

    // Backup values
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);

    // Set new values
    CreateInvItem(hero, itemId);
    Npc_SetTrueGuild(hero, GIL_NONE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    Npc_SetTrueGuild(hero, guildBak);
    Npc_RemoveInvItems(hero, itemId, 1);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
