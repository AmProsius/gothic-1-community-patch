/*
 * #102 The player doesn't lose ore when paying for Jesse
 *
 * The dialog function is called (the dialog lines are aborted) twice: Once with enough and once with too little amount
 * of ore.
 *
 * Expected behavior: The player will not give ore on the first pass but on the second one.
 */
func int Ninja_G1CP_Test_102() {
    // Create possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Find Bloodwyn first
    var int symbId; symbId = MEM_FindParserSymbol("GRD_233_Bloodwyn");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'GRD_233_Bloodwyn' not found");
        passed = FALSE;
    };

    // Check if Bloodwyn exists in the world
    var C_Npc bloodwyn; bloodwyn = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(bloodwyn)) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'GRD_233_Bloodwyn' not valid");
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_FindParserSymbol("Info_Bloodwyn_PayForJesse_Info");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog function 'Info_Bloodwyn_PayForJesse_Info' not found");
        passed = FALSE;
    };

    // Check if the variable exists
    var int topicPtr; topicPtr = MEM_GetSymbol("Jesse_PayForMe");
    if (!topicPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'Jesse_PayForMe' not found");
        passed = FALSE;
    };
    topicPtr += zCParSymbol_content_offset;

    // Check if the ore item exists
    var int oreId; oreId = MEM_FindParserSymbol("ItMiNugget");
    if (oreId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Item 'ItMiNugget' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int topicBak; topicBak = MEM_ReadInt(topicPtr);
    var int amountBefore; amountBefore = Npc_HasItems(hero, oreId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Remove all ore
    if (amountBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, amountBefore);
    };

    // Set the topic status variable to LOG_RUNNING
    MEM_WriteInt(topicPtr, LOG_RUNNING);

    // Set self and other
    self  = MEM_CpyInst(bloodwyn);
    other = MEM_CpyInst(hero);

    // Two passes
    var int amountPass1;
    var int amountPass2;
    var string msg;

    // First pass: Not enough ore, amount stays the same
    CreateInvItems(hero, oreId, 8);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Check the amount
    amountPass1 = Npc_HasItems(hero, oreId);
    if (amountPass1 > 8) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(8 - amountPass1));
        msg = ConcatStrings(msg, " ore");
        Ninja_G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass1 < 8) {
        msg = ConcatStrings("The hero wrongfully received ", IntToString(amountPass1 - 8));
        msg = ConcatStrings(msg, " ore");
        Ninja_G1CP_TestsuiteErrorDetail(msg);
    };

    // Reset
    if (amountPass1 > 0) {
        Npc_RemoveInvItems(hero, oreId, amountPass1);
    };
    MEM_WriteInt(topicPtr, LOG_RUNNING);

    // Second pass: Enough ore, amount is decrease by 10
    CreateInvItems(hero, oreId, 20); // Have at least 10 (to see if the amount decreases)

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Check the amount
    amountPass2 = Npc_HasItems(hero, oreId);
    if (amountPass2 == 20) {
        Ninja_G1CP_TestsuiteErrorDetail("The hero wrongfully kept all ore");
    } else if (amountPass2 < 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(10 - amountPass2));
        msg = ConcatStrings(msg, " ore too much");
        Ninja_G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass2 > 20) {
        msg = ConcatStrings("The hero wrongfully received ", IntToString(amountPass2 - 20));
        msg = ConcatStrings(msg, " ore");
        Ninja_G1CP_TestsuiteErrorDetail(msg);
    } else if (amountPass2 > 10) {
        msg = ConcatStrings("The hero wrongfully payed ", IntToString(amountPass2 - 10));
        msg = ConcatStrings(msg, " ore too little");
        Ninja_G1CP_TestsuiteErrorDetail(msg);
    };

    // Remove all ore
    if (amountPass2 > 0) {
        Npc_RemoveInvItems(hero, oreId, amountPass2);
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

    // Revert topic status
    MEM_WriteInt(topicPtr, topicBak);

    // Return success
    return (amountPass1 == 8) && (amountPass2 == 10);
};
