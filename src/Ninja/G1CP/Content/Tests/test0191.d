/*
 * #191 Cord teaches One-handed Sword Level 2 too soon
 *
 * The one-handed sword level is removed from the hero and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0191() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("SLD_709_Cord_TRAINAGAIN_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("SLD_709_Cord_TRAINAGAIN");
    const int NPC_TALENT_1H = 0; NPC_TALENT_1H = G1CP_Testsuite_GetIntConst("NPC_TALENT_1H");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, NPC_TALENT_1H);

    // Set new values
    G1CP_SetInfoToldI(infoId, TRUE);
    Npc_SetTalentSkill(hero, NPC_TALENT_1H, 0);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(infoId, toldBak);
    Npc_SetTalentSkill(hero, NPC_TALENT_1H, talentBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
