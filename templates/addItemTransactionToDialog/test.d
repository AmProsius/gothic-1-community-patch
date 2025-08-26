/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace dialog function name of "Info_Dialog_Function_Name" ###
    // ### TODO: Replace item name of "ItName" ###
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Dialog_Function_Name");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItName");

    // ### TODO: Replace desired amount int value of 0 ###
    const int amountDesired = 0;

    // Backup values
    var int amountBefore; amountBefore = Npc_HasItems(hero, itemId);

    // Remove all of the specific items and then add the desired amount plus and additional ten of the items
    const int debugAmountAdd = 10;
    const int debugAmount = amountDesired + debugAmountAdd;
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, itemId, amountBefore);
    };
    CreateInvItems(hero, itemId, debugAmount);

    // Just run the dialog and see what happens
    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    var int amountAfter; amountAfter = Npc_HasItems(hero, itemId);
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
