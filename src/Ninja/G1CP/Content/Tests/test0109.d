/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 */
func void G1CP_Test_0109() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Bloodwyn_PayDay_PayAgain");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMiNugget");
    const int transactionAmount = -10;

    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    GetItemHelper();
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 10000);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), 10000 + transactionAmount);
};
