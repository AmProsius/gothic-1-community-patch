/*
 * #183 Corristo sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDF guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_183() {
    const int GIL_KDF = 0; GIL_KDF = G1CP_Testsuite_GetIntConst("GIL_KDF", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDF_402_Corristo_HEAVYARMOR_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("KDF_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int trueGuildBak; trueGuildBak = Npc_GetTrueGuild(hero);

    // Set new values
    CreateInvItem(hero, itemId);
    Npc_SetTrueGuild(hero, GIL_KDF);
    hero.guild = GIL_KDF;

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    Npc_RemoveInvItems(hero, itemId, 1);
    Npc_SetTrueGuild(hero, trueGuildBak);
    hero.guild = guildBak;

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
