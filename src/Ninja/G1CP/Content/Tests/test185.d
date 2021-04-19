/*
 * #185 Scorpio offers to teach crossbow multiple times
 *
 * The hero's guild is reset and assigned to the Old Camp. The hero is given the crossbow level 1 talent and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_185() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = G1CP_GetFuncID("GRD_205_Scorpio_CROSSBOW_Condition", "int|none");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'GRD_205_Scorpio_CROSSBOW_Condition' not found");
        passed = FALSE;
    };

    // Check if the guild variable exists
    if (!G1CP_IsIntConst("GIL_GRD", 0)) {
        G1CP_TestsuiteErrorDetail("Integer constant 'GIL_GRD' not found");
        passed = FALSE;
    };

    // Check if the talent symbol exists
    if (!G1CP_IsIntConst("NPC_TALENT_CROSSBOW", 0)) {
        G1CP_TestsuiteErrorDetail("Integer constant 'NPC_TALENT_CROSSBOW' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    var int NPC_TALENT_CROSSBOW; NPC_TALENT_CROSSBOW = G1CP_GetIntConst("NPC_TALENT_CROSSBOW", 0, 0);
    var int GIL_GRD; GIL_GRD = G1CP_GetIntConst("GIL_GRD", 0, 0);

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, NPC_TALENT_CROSSBOW);

    // Set new values
    hero.guild = GIL_GRD;
    Npc_SetTalentSkill(hero, NPC_TALENT_CROSSBOW, 1);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    hero.guild = guildBak;
    Npc_SetTalentSkill(hero, NPC_TALENT_CROSSBOW, talentBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
