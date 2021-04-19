/*
 * #102 The player doesn't lose ore when paying for Jesse
 *
 * The dialog function is called (the dialog lines are aborted) twice: Once with enough and once with too little amount
 * of ore.
 *
 * Expected behavior: The player will not give ore on the first pass but on the second one.
 */
func int G1CP_Test_102() {
    // Create possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("Info_Bloodwyn_PayForJesse_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'Info_Bloodwyn_PayForJesse_Info' not found");
        passed = FALSE;
    };

    // Check if the variable exists
    var int topicPtr; topicPtr = MEM_GetSymbol("Jesse_PayForMe");
    if (!topicPtr) {
        G1CP_TestsuiteErrorDetail("Item 'Jesse_PayForMe' not found");
        passed = FALSE;
    };
    topicPtr += zCParSymbol_content_offset;

    // Check if the ore item exists
    var int oreId; oreId = MEM_GetSymbolIndex("ItMiNugget");
    if (oreId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItMiNugget' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int topicBak; topicBak = MEM_ReadInt(topicPtr);
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);

    // Remove all ore
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };

    // Set the topic status variable to LOG_RUNNING
    MEM_WriteInt(topicPtr, LOG_RUNNING);

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
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(8 - amountPass1));
        msg = ConcatStrings(msg, " ore");
        G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass1 < 8) {
        msg = ConcatStrings("The hero wrongfully received ", IntToString(amountPass1 - 8));
        msg = ConcatStrings(msg, " ore");
        G1CP_TestsuiteErrorDetail(msg);
    };

    // Reset
    if (amountPass1 > 0) {
        Npc_RemoveInvItems(hero, oreId, amountPass1);
    };
    MEM_WriteInt(topicPtr, LOG_RUNNING);

    // Second pass: Enough ore, amount is decrease by 10
    CreateInvItems(hero, oreId, 20); // Have at least 10 (to see if the amount decreases)

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);

    // Check the amount
    amountPass2 = Npc_HasItems(hero, oreId);
    if (amountPass2 == 20) {
        G1CP_TestsuiteErrorDetail("The hero wrongfully kept all ore");
    } else if (amountPass2 < 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(10 - amountPass2));
        msg = ConcatStrings(msg, " ore too much");
        G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass2 > 20) {
        msg = ConcatStrings("The hero wrongfully received ", IntToString(amountPass2 - 20));
        msg = ConcatStrings(msg, " ore");
        G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass2 > 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(amountPass2 - 10));
        msg = ConcatStrings(msg, " ore too little");
        G1CP_TestsuiteErrorDetail(msg);
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
    MEM_WriteInt(topicPtr, topicBak);

    // Return success
    return (amountPass1 == 8) && (amountPass2 == 10);
};
