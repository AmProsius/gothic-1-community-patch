/*
 * #23 Baal Namib sells Novice's Armor too late
 *
 * The dialog function is called with the necessary requirements.
 *
 * Expected behavior: The armor is sold at chapter 2.
 */
func int G1CP_Test_023() {
    var int chptId; chptId = G1CP_Testsuite_CheckIntVar("Kapitel", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("GUR_1204_BaalNamib_ARMOR_Info");
    var int armorId; armorId = G1CP_Testsuite_CheckItem("NOV_ARMOR_H");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMinugget");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int chapterBak; chapterBak = G1CP_GetIntVarI(chptId, 0, 0);
    var int armorBefore; armorBefore = Npc_HasItems(hero, armorId);
    var int oreBefore; oreBefore = Npc_HasItems(hero, oreId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Remove all necessary items (ignores equipped armor, give me a break)
    if (armorBefore > 0) {
        Npc_RemoveInvItems(hero, armorId, armorBefore);
    };
    if (oreBefore > 0) {
        Npc_RemoveInvItems(hero, oreId, oreBefore);
    };

    // Set new values
    G1CP_SetIntVarI(chptId, 0, 2);
    CreateInvItems(hero, oreId, 5000); // Give enough ore (don't care about the details)
    GetItemHelper();
    self = MEM_CpyInst(Item_Helper);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self = MEM_CpyInst(slfBak);
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

    // Restore the chapter
    G1CP_SetIntVarI(chptId, 0, chapterBak);

    // Check the amount
    if (armorAfter > 0) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail("The hero did not receive the armor");
        return FALSE;
    };
};
