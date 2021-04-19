/*
 * #60 Jesse's quest not available
 *
 * The required dialog is set to told and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int G1CP_Test_060() {
    // Check if the dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Jesse_Mission_Condition");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_Jesse_Mission_Condition' not found");
        return FALSE;
    };

    // Backup values
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, MEM_GetSymbolIndex("DIA_Jesse_Warn"));
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, MEM_GetSymbolIndex("DIA_Jesse_Mission"));

    // Set new values
    G1CP_SetInfoTold("DIA_Jesse_Warn", TRUE);
    G1CP_SetInfoTold("DIA_Jesse_Mission", FALSE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoTold("DIA_Jesse_Warn", told1Bak);
    G1CP_SetInfoTold("DIA_Jesse_Mission", told2Bak);

    // Check return value
    if (ret) {
        return TRUE;
    } else {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };
};
