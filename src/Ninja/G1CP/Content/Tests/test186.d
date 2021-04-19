/*
 * #186 Corristo can be asked to join the mages multiple times
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_186() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = G1CP_GetFuncID("KDF_402_Corristo_WANNBEKDF_Condition", "int|none");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'KDF_402_Corristo_WANNBEKDF_Condition' not found");
        passed = FALSE;
    };

    // Check if guild exists
    if (!G1CP_IsIntConst("GIL_STT", 0)) {
        G1CP_TestsuiteErrorDetail("Variable 'GIL_STT' not found");
        passed = FALSE;
    };

    // Check if variable exists
    if (!G1CP_IsIntVar("Corristo_KDFAufnahme", 0)) {
        G1CP_TestsuiteErrorDetail("Variable 'Corristo_KDFAufnahme' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    var int GIL_STT; GIL_STT = G1CP_GetIntConst("GIL_STT", 0, 0);

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, G1CP_GetInfoInstID("GRD_200_Thorus_WANNABEMAGE"));
    var int kdfAufnahmeBak; kdfAufnahmeBak = G1CP_GetIntVar("Corristo_KDFAufnahmer", 0, 0);
    var int guildBak; guildBak = hero.guild;

    // Set new values
    G1CP_SetInfoTold("GRD_200_Thorus_WANNABEMAGE", TRUE);
    hero.guild = GIL_STT;
    G1CP_SetIntVar("Corristo_KDFAufnahmer", 0, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoTold("GRD_200_Thorus_WANNABEMAGE", toldBak);
    hero.guild = guildBak;
    G1CP_SetIntVar("Corristo_KDFAufnahmer", 0, kdfAufnahmeBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
