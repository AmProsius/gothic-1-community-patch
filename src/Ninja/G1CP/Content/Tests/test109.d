/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 *
 * The dialog function is called (the dialog lines are aborted) with enough ore available.
 *
 * Expected behavior: The player will lose 10 ore.
 */
func int G1CP_Test_109() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Bloodwyn_PayDay_PayAgain");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);

    // Remove all ore and then add 20
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };
    CreateInvItems(hero, oreId, 20);

    // Just run the dialog and see what happens
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    var string msg;
    var int amountAfter; amountAfter = Npc_HasItems(hero, oreId);
    if (amountAfter == 20) {
        G1CP_TestsuiteErrorDetail("The hero wrongfully kept all ore");
    } else if (amountAfter < 10) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully payed ", 10 - amountAfter, " ore too much");
    } else if (amountAfter > 20) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully received ", amountAfter - 20, " ore");
    } else if (amountAfter > 10) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully payed ", amountAfter - 10, " ore too little");
    };

    // Remove all ore
    if (amountAfter > 0) {
        Npc_RemoveInvItems(hero, oreId, amountAfter);
    };

    // Restore any ore
    if (amountBefore > 0) {
        CreateInvItems(hero, oreId, amountBefore);
    };

    // Return success
    return (amountAfter == 10);
};
