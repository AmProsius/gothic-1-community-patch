/*
 * #23 Baal Namib sells Novice's Armor too late
 *
 * The dialog function is called with the necessary requirements.
 *
 * Expected behavior: The armor is sold at chapter 2.
 */
func int G1CP_Test_0023() {
    var int chptId; chptId = G1CP_Testsuite_CheckIntVar("Kapitel");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("GUR_1204_BaalNamib_ARMOR_Info");
    var int armorId; armorId = G1CP_Testsuite_CheckItem("NOV_ARMOR_H");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMinugget");
    G1CP_Testsuite_CheckPassed();

    var int chapterBak; chapterBak = G1CP_GetIntVarI(chptId, 0, 0);
    var int armorBefore; armorBefore = Npc_HasItems(hero, armorId);
    var int oreBefore; oreBefore = Npc_HasItems(hero, oreId);
    if (final()) {
        G1CP_Testsuite_NpcSetInvItemAmount(hero, armorId, armorBefore);
        G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, oreBefore);
        G1CP_SetIntVarI(chptId, 0, chapterBak);
    };

    G1CP_SetIntVarI(chptId, 0, 2);
    G1CP_Testsuite_NpcSetInvItemAmount(hero, armorId, 0); // Ignores equipped armor, but well.
    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 5000);

    GetItemHelper();
    G1CP_Testsuite_Call(funcId, Item_Helper, hero, TRUE);
    G1CP_Testsuite_AssertGt(Npc_HasItems(hero, armorId), 0);

    return TRUE;
};
