/*
 * #17 Jackal doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0017() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Jackal_Hello_Condition");

    G1CP_Testsuite_BackupTrueGuild(hero);
    Npc_SetTrueGuild(hero, 4); // Random guild

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
