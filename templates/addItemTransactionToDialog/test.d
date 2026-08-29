/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@;
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("### TODO Dialog function name ###");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("### TODO Item instance name ###");
    const int transactionAmount = /*### TODO Replace '-10' with the desired amount ###*/-10;

    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    GetItemHelper();
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 10000);
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_Assert(Npc_HasItems(hero, itemId), 10000 + transactionAmount);
};
