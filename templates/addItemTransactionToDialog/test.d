/*
 * #{ISSUE_NUM} {LONGNAME}
 *
* The dialog function is called (the dialog lines are aborted) and the transaction is checked.
 *
 * Expected behavior: The player will give the correct number of items during the dialog function.
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    const int funcId = -1; funcId = G1CP_Testsuite_CheckDialogFunc("### TODO: Dialog function name ###");
    const int itemId = -1; itemId = G1CP_Testsuite_CheckItem("### TODO: Item name ###");
    G1CP_Testsuite_CheckPassed();

    const int amountDesired = /* ### TODO: Replace '0' with the desired integer amount ### */ 0;

    // Backup values
    const int amountBefore = 0; amountBefore = Npc_HasItems(hero, itemId);

    // Remove all of the specific items and then add the desired amount plus an additional amount of the items
    const int debugAmountAdd = 500;
    const int debugAmount = amountDesired + debugAmountAdd;
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, itemId, amountBefore);
    };
    CreateInvItems(hero, itemId, debugAmount);

    // Just run the dialog and see what happens
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    const int amountAfter = 0; amountAfter = Npc_HasItems(hero, itemId);
    if (amountAfter == debugAmount) {
        G1CP_TestsuiteErrorDetail("The hero wrongfully kept all of the items");
    } else if (amountAfter < debugAmountAdd) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully gave ", debugAmountAdd - amountAfter, " items too much");
    } else if (amountAfter > debugAmount) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully received ", amountAfter - debugAmount, " items");
    } else if (amountAfter > debugAmountAdd) {
        G1CP_TestsuiteErrorDetailSIS("The hero wrongfully gave ", amountAfter - debugAmountAdd, " items too little");
    };

    // Restore the initial amount of the specific items
    if (amountAfter > 0) {
        Npc_RemoveInvItems(hero, itemId, amountAfter);
    };
    if (amountBefore > 0) {
        CreateInvItems(hero, itemId, amountBefore);
    };

    // Return success
    return (amountAfter == amountDesired);
};
