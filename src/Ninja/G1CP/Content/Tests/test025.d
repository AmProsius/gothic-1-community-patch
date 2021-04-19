/*
 * #25 Saturas sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDW guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_025() {
    const int GIL_KDW = 0; GIL_KDW = G1CP_Testsuite_GetIntConst("GIL_KDW", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDW_600_Saturas_HEAVYARMOR_Condition");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("KDW_ARMOR_H");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int trueGuildBak; trueGuildBak = Npc_GetTrueGuild(hero);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    CreateInvItem(hero, itemId);
    Npc_SetTrueGuild(hero, GIL_KDW);
    hero.guild = GIL_KDW;
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
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
