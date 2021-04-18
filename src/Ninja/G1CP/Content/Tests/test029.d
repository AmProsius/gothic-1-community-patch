/*
 * #29 Buster trains Acrobatics multiple times
 *
 * The hero is given the acrobatics talent and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_029() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_ORG_833_Buster3_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_ORG_833_Buster");
    var int talId; talId = G1CP_Testsuite_CheckIntConst("NPC_TALENT_ACROBAT", 0);
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const int TALENT = 0; TALENT = G1CP_GetIntConstI(talId, 0, 0);

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int talentBak; talentBak = Npc_GetTalentSkill(hero, TALENT);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetInfoToldI(infoId, TRUE);
    Npc_SetTalentSkill(hero, TALENT, TRUE);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetInfoToldI(infoId, toldBak);
    Npc_SetTalentSkill(hero, TALENT, talentBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
