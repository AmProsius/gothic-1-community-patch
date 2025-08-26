/*
 * #185 Scorpio offers to teach crossbow multiple times
 *
 * The hero's guild is reset and assigned to the Old Camp. The hero is given the crossbow level 1 talent and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0185() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("GRD_205_Scorpio_CROSSBOW_Condition");
    const int NPC_TALENT_CROSSBOW = 0; NPC_TALENT_CROSSBOW = G1CP_Testsuite_GetIntConst("NPC_TALENT_CROSSBOW");
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");

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
