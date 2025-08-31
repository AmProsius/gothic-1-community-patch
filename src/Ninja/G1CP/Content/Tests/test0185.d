/*
 * #185 Scorpio offers to teach crossbow multiple times
 *
 * The hero's guild is reset and assigned to the Old Camp. The hero is given the crossbow level 1 talent and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0185() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("GRD_205_Scorpio_CROSSBOW_Condition");
    const int NPC_TALENT_CROSSBOW = 0; NPC_TALENT_CROSSBOW = G1CP_Testsuite_GetIntConst("NPC_TALENT_CROSSBOW");
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");

    G1CP_Testsuite_BackupIntAddr(_@(hero.guild));
    G1CP_Testsuite_BackupTalentSkill(hero, NPC_TALENT_CROSSBOW);

    hero.guild = GIL_GRD;
    Npc_SetTalentSkill(hero, NPC_TALENT_CROSSBOW, 1);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
