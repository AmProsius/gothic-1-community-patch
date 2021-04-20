/*
 * #111 The player doesn't lose ore when paying protection money to Jackal
 *
 * The dialog function is called (the dialog lines are aborted) twice: Once with enough and once with too little amount
 * of ore.
 *
 * Expected behavior: The player will not give ore on the first pass but on the second one.
 */
func int G1CP_Test_111() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Jackal_Hello_Pay");
    var int paidId; paidId = G1CP_Testsuite_CheckIntVar("Jackal_ProtectionPaid", 0);
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int paidStatusBak; paidStatusBak = G1CP_GetIntVarI(paidId, 0, 0);
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);

    // Remove all ore
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };

    // Set variable
    G1CP_SetIntVarI(paidId, 0, FALSE);

    // Two passes
    var int amountPass1;
    var int amountPass2;
    var string msg;

    // First pass: Not enough ore, amount stays the same
    CreateInvItems(hero, oreId, 8);

    // Just run the dialog and see what happens
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    amountPass1 = Npc_HasItems(hero, oreId);
    if (amountPass1 > 8) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully payed ", 8 - amountPass1, " ore");
    } else if (amountPass1 < 8) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully received ", amountPass1 - 8, " ore");
    };

    // Reset
    if (amountPass1 > 0) {
        Npc_RemoveInvItems(hero, oreId, amountPass1);
    };
    G1CP_SetIntVarI(paidId, 0, FALSE);

    // Second pass: Enough ore, amount is decrease by 10
    CreateInvItems(hero, oreId, 20); // Have at least 10 (to see if the amount decreases)

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    amountPass2 = Npc_HasItems(hero, oreId);
    if (amountPass2 == 20) {
        G1CP_TestsuiteErrorDetail("The hero wrongfully kept all ore");
    } else if (amountPass2 < 10) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully payed ", 10 - amountPass2, " ore too much");
    } else if (amountPass2 > 20) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully received ", amountPass2 - 20, " ore");
    } else if (amountPass2 > 10) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully payed ", amountPass2 - 10, " ore too little");
    };

    // Remove all ore
    if (amountPass2 > 0) {
        Npc_RemoveInvItems(hero, oreId, amountPass2);
    };

    // Restore any ore
    if (amountBefore > 0) {
        CreateInvItems(hero, oreId, amountBefore);
    };

    // Revert topic status
    G1CP_SetIntVarI(paidId, 0, paidStatusBak);

    // Return success
    return (amountPass1 == 8) && (amountPass2 == 10);
};
