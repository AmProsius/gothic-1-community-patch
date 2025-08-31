/*
 * #79 Wolf teaches guards dexterity instead of bandits/mercs
 *
 * The hero's guild is reset and assigned to the new camp. The condition function of the dialog is called for each.
 *
 * Expected behavior: The condition function will return FALSE for the first and TRUE for the second pass.
 */
func void G1CP_Test_0079() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("ORG_855_Wolf_Teach_Condition");
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    const int GIL_ORG = 0; GIL_ORG = G1CP_Testsuite_GetIntConst("GIL_ORG");

    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupIntAddr(_@(hero.guild));

    // The dialog is refused with the incorrect guild.
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    // The dialog is accepted with the correct guild.
    hero.guild = GIL_ORG;
    Npc_SetTrueGuild(hero, GIL_ORG);
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
};
