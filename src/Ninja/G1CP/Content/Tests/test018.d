/*
 * #18 Bloodwyn doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_018() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Bloodwyn_Hello_Condition");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);

    // Set new values
    Npc_SetTrueGuild(hero, 4); // Random guild

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    Npc_SetTrueGuild(hero, guildBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
