/*
 * #25 Saturas sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDW guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0025() {
    const int GIL_KDW = 0; GIL_KDW = G1CP_Testsuite_GetIntConst("GIL_KDW");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDW_600_Saturas_HEAVYARMOR_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("KDW_ARMOR_H");

    var int guildBak; guildBak = hero.guild;
    var int trueGuildBak; trueGuildBak = Npc_GetTrueGuild(hero);
    if (final()) {
        var int r; r = Npc_RemoveInvItems(hero, itemId, 1);
        Npc_SetTrueGuild(hero, trueGuildBak);
        hero.guild = guildBak;
    };

    CreateInvItem(hero, itemId);
    Npc_SetTrueGuild(hero, GIL_KDW);
    hero.guild = GIL_KDW;

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    return TRUE;
};
