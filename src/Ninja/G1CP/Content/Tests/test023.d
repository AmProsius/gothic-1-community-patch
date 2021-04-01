/*
 * #23 Baal Namib sells Novice's Armor too late
 *
 * The dialog function is called with the necessary requirements.
 *
 * Expected behavior: The armor is sold at chapter 2.
 */
func int G1CP_Test_023() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog function exists
    var int funcId; funcId = MEM_GetSymbolIndex("GUR_1204_BaalNamib_ARMOR_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'GUR_1204_BaalNamib_ARMOR_Info' not found");
        passed = FALSE;
    };

    // Check if the variable exists
    var int chapterPtr; chapterPtr = MEM_GetSymbol("Kapitel");
    if (!chapterPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Kapitel' not found");
        passed = FALSE;
    };
    chapterPtr += zCParSymbol_content_offset;

    // Check if the armor item exists
    var int armorId; armorId = MEM_GetSymbolIndex("NOV_ARMOR_H");
    if (armorId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'NOV_ARMOR_H' not found");
        passed = FALSE;
    };

    // Check if the ore item exists
    var int oreId; oreId = MEM_GetSymbolIndex("ItMinugget");
    if (oreId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItMinugget' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int chapterBak; chapterBak = MEM_ReadInt(chapterPtr);
    var int armorBefore; armorBefore = Npc_HasItems(hero, armorId);
    var int oreBefore; oreBefore = Npc_HasItems(hero, oreId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Remove all armor (ignores equipped armor, give me a break)
    if (armorBefore > 0) {
        Npc_RemoveInvItems(hero, armorId, armorBefore);
    };
    if (oreBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, oreBefore);
    };

    // Set variable
    MEM_WriteInt(chapterPtr, 2);

    // Give enough ore (don't care about the details)
    CreateInvItems(hero, oreId, 5000);

    // Set self and other
    GetItemHelper();
    self  = MEM_CpyInst(Item_Helper);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore the amount of ore
    var int oreAfter; oreAfter = Npc_HasItems(hero, oreId);
    if (oreAfter > 0) {
        Npc_RemoveInvItems(hero, oreId, oreAfter);
    };
    if (oreBefore > 0) {
        CreateInvItems(hero, oreId, oreBefore);
    };

    // Restore the armor
    var int armorAfter; armorAfter = Npc_HasItems(hero, armorId);
    if (armorAfter > 0) {
        Npc_RemoveInvItems(hero, armorId, armorAfter);
    };
    if (armorBefore > 0) {
        CreateInvItems(hero, armorId, armorBefore);
    };

    // Revert variable
    MEM_WriteInt(chapterPtr, chapterBak);

    // Check the amount
    if (armorAfter > 0) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail("The hero did not receive the armor");
        return FALSE;
    };
};
