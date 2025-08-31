/*
 * #183 Corristo sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDF guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0183() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDF_402_Corristo_HEAVYARMOR_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("KDF_ARMOR_H");
    const int GIL_KDF = 0; GIL_KDF = G1CP_Testsuite_GetIntConst("GIL_KDF");

    G1CP_Testsuite_BackupIntAddr(_@(hero.guild));
    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupInvAmount(hero, itemId);

    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 1);
    Npc_SetTrueGuild(hero, GIL_KDF);
    hero.guild = GIL_KDF;

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
