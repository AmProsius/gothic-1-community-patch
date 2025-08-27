/*
 * #29 Buster trains Acrobatics multiple times
 *
 * The hero is given the acrobatics talent and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0029() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_ORG_833_Buster3_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_ORG_833_Buster");
    const int NPC_TALENT_ACROBAT = 0; NPC_TALENT_ACROBAT = G1CP_Testsuite_GetIntConst("NPC_TALENT_ACROBAT");

    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupTalentSkill(hero, NPC_TALENT_ACROBAT);

    G1CP_SetInfoToldI(infoId, TRUE);
    Npc_SetTalentSkill(hero, NPC_TALENT_ACROBAT, TRUE);
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
