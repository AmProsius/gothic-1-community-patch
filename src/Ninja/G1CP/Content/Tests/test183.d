/*
 * #183 Corristo sells High Robe multiple times
 *
 * The hero is given the heavy robe and the KDF guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_183() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("KDF_402_Corristo_HEAVYARMOR_Condition");
    var int robeId; robeId = G1CP_Testsuite_CheckItem("KDF_ARMOR_H");
    var int guildId; guildId = G1CP_Testsuite_CheckIntConst("GIL_KDF", 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const int GUILD = 0; GUILD = G1CP_GetIntConstI(guildId, 0, 0);

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int trueGuildBak; trueGuildBak = Npc_GetTrueGuild(hero);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    CreateInvItem(hero, robeId);
    Npc_SetTrueGuild(hero, GUILD);
    hero.guild = GUILD;
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    Npc_RemoveInvItems(hero, robeId, 1);
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
