/*
 * #109 The player doesn't lose ore when paying protection money to Bloodwyn again
 *
 * The dialog function is called (the dialog lines are aborted) with enough ore available.
 *
 * Expected behavior: The player will lose 10 ore.
 */
func int G1CP_Test_109() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog function exists
    var int funcId; funcId = MEM_FindParserSymbol("Info_Bloodwyn_PayDay_PayAgain");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'Info_Bloodwyn_PayDay_PayAgain' not found");
        passed = FALSE;
    };

    // Check if the ore item exists
    var int oreId; oreId = MEM_FindParserSymbol("ItMiNugget");
    if (oreId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItMiNugget' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Remove all ore and then add 20
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };
    CreateInvItems(hero, oreId, 20);

    // Set self and other
    GetItemHelper();
    self  = MEM_CpyInst(Item_Helper);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Check the amount
    var string msg;
    var int amountAfter; amountAfter = Npc_HasItems(hero, oreId);
    if (amountAfter == 20) {
        G1CP_TestsuiteErrorDetail("The hero wrongfully kept all ore");
    } else if (amountAfter < 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(10 - amountAfter));
        msg = ConcatStrings(msg, " ore too much");
        G1CP_TestsuiteErrorDetail(msg);
    } else if (amountAfter > 20) {
        msg = ConcatStrings("The hero wrongfully received ", IntToString(amountAfter - 20));
        msg = ConcatStrings(msg, " ore");
        G1CP_TestsuiteErrorDetail(msg);
    } else if (amountAfter > 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(amountAfter - 10));
        msg = ConcatStrings(msg, " ore too little");
        G1CP_TestsuiteErrorDetail(msg);
    };

    // Remove all ore
    if (amountAfter > 0) {
        Npc_RemoveInvItems(hero, oreId, amountAfter);
    };

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore any ore
    if (amountBefore > 0) {
        CreateInvItems(hero, oreId, amountBefore);
    };

    // Return success
    return (amountAfter == 10);
};
