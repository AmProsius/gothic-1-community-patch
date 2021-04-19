/*
 * #40 Aleph's key dialog doesn't disappear
 *
 * The necessary dialogs including the one from the new condition are set to told and the dialog function is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_040() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Org_804_FirstWarn_Condition");
    var int ulbertId; ulbertId = G1CP_Testsuite_CheckInfo("GRD_271_ULBERT_DRUNK");
    var int brandickId; brandickId = G1CP_Testsuite_CheckInfo("GRD_261_Brandick_ALEPH");
    var int alephId; alephId = G1CP_Testsuite_CheckInfo("VLK_585_Aleph_SCHUPPEN");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int ulberBak; ulberBak = Npc_KnowsInfo(hero, ulbertId);
    var int brandickBak; brandickBak = Npc_KnowsInfo(hero, brandickId);
    var int alephBak; alephBak = Npc_KnowsInfo(hero, alephId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetInfoToldI(ulbertId, TRUE);
    G1CP_SetInfoToldI(brandickId, TRUE);
    G1CP_SetInfoToldI(alephId, TRUE);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetInfoToldI(ulbertId, ulberBak);
    G1CP_SetInfoToldI(brandickId, brandickBak);
    G1CP_SetInfoToldI(alephId, alephBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
