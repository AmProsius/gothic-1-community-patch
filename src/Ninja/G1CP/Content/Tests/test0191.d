/*
 * #191 Cord teaches One-handed Sword Level 2 too soon
 *
 * The one-handed sword level is removed from the hero and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0191() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("SLD_709_Cord_TRAINAGAIN_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("SLD_709_Cord_TRAINAGAIN");
    const int NPC_TALENT_1H = 0; NPC_TALENT_1H = G1CP_Testsuite_GetIntConst("NPC_TALENT_1H");

    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupTalentSkill(hero, NPC_TALENT_1H);

    G1CP_SetInfoToldI(infoId, TRUE);
    Npc_SetTalentSkill(hero, NPC_TALENT_1H, 0);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
