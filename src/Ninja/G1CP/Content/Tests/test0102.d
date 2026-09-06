/*
 * #102 The player doesn't lose ore when paying for Jesse
 */
func void G1CP_Test_0102() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Bloodwyn_PayForJesse_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var int questId; questId = G1CP_Testsuite_CheckIntVar("Jesse_PayForMe");
    const int LOG_RUNNING = 1;
    const int transactionAmount = -10;
    const int notEnough = 8;

    G1CP_Testsuite_BackupInvAmount(hero, itemId);
    G1CP_Testsuite_BackupInt(questId, 0);

    GetItemHelper();

    // Not enough ore, amount stays the same
    G1CP_SetIntVarI(questId, 0, LOG_RUNNING);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, notEnough);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), notEnough);

    // Enough ore, amount is decreased by 10
    G1CP_SetIntVarI(questId, 0, LOG_RUNNING);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 10000);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), 10000 + transactionAmount);
};
