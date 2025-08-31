/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 *
 * The dialog function is called (the dialog lines are aborted) twice: Once with with too little and once with enough
 * ore.
 *
 * Expected behavior: The player will not give ore on the first pass but on the second one.
 */
func void G1CP_Test_0111() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Jackal_Hello_Pay");
    var int paidId; paidId = G1CP_Testsuite_CheckIntVar("Jackal_ProtectionPaid");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");

    G1CP_Testsuite_BackupInt(paidId, 0);
    G1CP_Testsuite_BackupInvAmount(hero, oreId);

    // Not enough ore, amount stays the same
    G1CP_SetIntVarI(paidId, 0, FALSE);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 8);
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, oreId), 8);

    // Enough ore, amount is decreased by 10
    G1CP_SetIntVarI(paidId, 0, FALSE);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 20); // Have at least 10 (to see if the amount decreases)
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, oreId), 10);
};
