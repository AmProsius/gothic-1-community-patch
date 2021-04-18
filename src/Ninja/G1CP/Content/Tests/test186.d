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
    var int toldBak; toldBak = Npc_KnowsInfo(hero, G1CP_GetInfoInstID("GRD_200_Thorus_WANNABEMAGE")); // Told status
    var int kdfAufnahmeBak; kdfAufnahmeBak = G1CP_GetIntVar("Corristo_KDFAufnahmer", 0, 0);           // Variable
    var int guildBak; guildBak = hero.guild;                                                          // Player guild
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                     // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                                    // Other

    // Set new values
    G1CP_SetInfoTold("GRD_200_Thorus_WANNABEMAGE", TRUE);                                             // Told status
    hero.guild = GIL_STT;                                                                             // Player guild
    G1CP_SetIntVar("Corristo_KDFAufnahmer", 0, TRUE);                                                 // Variable
    self  = MEM_CpyInst(hero);                                                                        // Self
    other = MEM_CpyInst(hero);                                                                        // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                      // Self
    other = MEM_CpyInst(othBak);                                                                      // Other
    G1CP_SetInfoTold("GRD_200_Thorus_WANNABEMAGE", toldBak);                                          // Told status
    hero.guild = guildBak;                                                                            // Player guild
    G1CP_SetIntVar("Corristo_KDFAufnahmer", 0, kdfAufnahmeBak);                                       // Variable

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};