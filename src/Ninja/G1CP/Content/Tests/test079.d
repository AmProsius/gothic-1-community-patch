/*
 * #79 Wolf teaches guards dexterity instead of bandits/mercs
 *
 * The hero's guild is reset and assigned to the new camp. The condition function of the dialog is called for each.
 *
 * Expected behavior: The condition function will return FALSE for the first and TRUE for the second pass.
 */
func int G1CP_Test_079() {
    var int symbPtr;
    var int GIL_GRD;
    var int GIL_ORG;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("ORG_855_Wolf_Teach_Condition");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'ORG_855_Wolf_Teach_Condition' not found");
        passed = FALSE;
    };

    // Check if guild exists
    symbPtr = MEM_GetSymbol("GIL_GRD");
    if (!symbPtr) {
        G1CP_TestsuiteErrorDetail("Symbol 'GIL_GRD' not found");
        passed = FALSE;
    } else {
        GIL_GRD = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // Check if guild exists
    symbPtr = MEM_GetSymbol("GIL_ORG");
    if (!symbPtr) {
        G1CP_TestsuiteErrorDetail("Symbol 'GIL_ORG' not found");
        passed = FALSE;
    } else {
        GIL_ORG = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int guildTrueBak; guildTrueBak = Npc_GetTrueGuild(hero);

    // Do two passes (first one should yield true, second false)
    var int ret1;
    var int ret2;

    // First pass
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    ret1 = MEM_PopIntResult();
    if (ret1) {
        G1CP_TestsuiteErrorDetail("Dialog condition returned true for GIL_GRD");
    };

    // Second pass
    hero.guild = GIL_ORG;
    Npc_SetTrueGuild(hero, GIL_ORG);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    ret2 = MEM_PopIntResult();
    if (!ret2) {
        G1CP_TestsuiteErrorDetail("Dialog condition returned false for GIL_ORG");
    };

    // Restore values
    hero.guild = guildBak;
    Npc_SetTrueGuild(hero, guildTrueBak);

    // Pass on return value
    return (!ret1) && (ret2);
};
