/*
 * #29 Buster trains Acrobatics multiple times
 *
 * The hero is given the acrobatics talent and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0029() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_ORG_833_Buster3_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_ORG_833_Buster");
    const int NPC_TALENT_ACROBAT = 0; NPC_TALENT_ACROBAT = G1CP_Testsuite_GetIntConst("NPC_TALENT_ACROBAT", 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT);

    // Set new values
    G1CP_SetInfoToldI(infoId, TRUE);
    Npc_SetTalentSkill(hero, NPC_TALENT_ACROBAT, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(infoId, toldBak);
    Npc_SetTalentSkill(hero, NPC_TALENT_ACROBAT, talentBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
