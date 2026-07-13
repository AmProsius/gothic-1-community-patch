/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 */
func void G1CP_Test_0111() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Jackal_Hello_Pay");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var int paidId; paidId = G1CP_Testsuite_CheckIntVar("Jackal_ProtectionPaid");
    const int transactionAmount = -10;
    const int notEnough = 8;

    G1CP_Testsuite_BackupInvAmount(hero, itemId);
    G1CP_Testsuite_BackupInt(paidId, 0);

    GetItemHelper();

    // Not enough ore, amount stays the same
    G1CP_SetIntVarI(paidId, 0, FALSE);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, notEnough);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), notEnough);

    // Enough ore, amount is decreased by 10
    G1CP_SetIntVarI(paidId, 0, FALSE);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 10000);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), 10000 + transactionAmount);
};
