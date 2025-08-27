/*
 * #25 Saturas sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDW guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0025() {
    const int GIL_KDW = 0; GIL_KDW = G1CP_Testsuite_GetIntConst("GIL_KDW");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDW_600_Saturas_HEAVYARMOR_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("KDW_ARMOR_H");

    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    CreateInvItem(hero, itemId);
    Npc_SetTrueGuild(hero, GIL_KDW);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
