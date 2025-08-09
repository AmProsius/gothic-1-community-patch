/*
 * #79 Wolf teaches guards dexterity instead of bandits/mercs
 *
 * The hero's guild is reset and assigned to the new camp. The condition function of the dialog is called for each.
 *
 * Expected behavior: The condition function will return FALSE for the first and TRUE for the second pass.
 */
func int G1CP_Test_0079() {
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    const int GIL_ORG = 0; GIL_ORG = G1CP_Testsuite_GetIntConst("GIL_ORG");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("ORG_855_Wolf_Teach_Condition");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int trueGuildBak; trueGuildBak = Npc_GetTrueGuild(hero);

    // Do two passes (first one should yield true, second false)
    var int pass1;
    var int pass2;

    // First pass
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    pass1 = MEM_PopIntResult();
    if (pass1) {
        G1CP_TestsuiteErrorDetail("Dialog condition returned true for GIL_GRD");
    };

    // Second pass
    hero.guild = GIL_ORG;
    Npc_SetTrueGuild(hero, GIL_ORG);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    pass2 = MEM_PopIntResult();
    if (!pass2) {
        G1CP_TestsuiteErrorDetail("Dialog condition returned false for GIL_ORG");
    };

    // Restore values
    hero.guild = guildBak;
    Npc_SetTrueGuild(hero, trueGuildBak);

    // Pass on return value
    return (!pass1) && (pass2);
};
