/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 *
 * The dialog function is called (the dialog lines are aborted) with enough ore available.
 *
 * Expected behavior: The player will lose 10 ore.
 */
func void G1CP_Test_0109() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Bloodwyn_PayDay_PayAgain");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");

    G1CP_Testsuite_BackupInvAmount(hero, oreId);

    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 20);
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, oreId), 10);
};
