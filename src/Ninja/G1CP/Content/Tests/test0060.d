/*
 * #60 Jesse's quest not available
 *
 * The required dialog is set to told and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int G1CP_Test_0060() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Jesse_Mission_Condition");
    var int warnId; warnId = G1CP_Testsuite_CheckInfo("DIA_Jesse_Warn");
    var int missionId; missionId = G1CP_Testsuite_CheckInfo("DIA_Jesse_Mission");

    // Backup values
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, warnId);
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, missionId);

    // Set new values
    G1CP_SetInfoToldI(warnId, TRUE);
    G1CP_SetInfoToldI(missionId, FALSE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(warnId, told1Bak);
    G1CP_SetInfoToldI(missionId, told2Bak);

    // Check return value
    if (ret) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };
};
