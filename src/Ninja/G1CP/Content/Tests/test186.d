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
    var int funcId; funcId = MEM_GetSymbolIndex("KDF_402_Corristo_WANNBEKDF_Condition");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'KDF_402_Corristo_WANNBEKDF_Condition' not found");
        passed = FALSE;
    };

    // Check if guild exists
    var int symbPtr; symbPtr = MEM_GetSymbol("GIL_STT");
    if (!symbPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'GIL_STT' not found");
        passed = FALSE;
    };
    var int GIL_STT; GIL_STT = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // Check if variable exists
    var int kdfAufnahmePtr; kdfAufnahmePtr = MEM_GetSymbol("Corristo_KDFAufnahme");
    if (!kdfAufnahmePtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Corristo_KDFAufnahme' not found");
        passed = FALSE;
    };
    kdfAufnahmePtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, MEM_GetSymbolIndex("GRD_200_Thorus_WANNABEMAGE")); // Told status
    var int kdfAufnahmeBak; kdfAufnahmeBak = MEM_ReadInt(kdfAufnahmePtr);                             // Variable
    var int guildBak; guildBak = hero.guild;                                                          // Player guild
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                     // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                                    // Other

    // Set new values
    G1CP_SetInfoTold("GRD_200_Thorus_WANNABEMAGE", TRUE);                                             // Told status
    hero.guild = GIL_STT;                                                                             // Player guild
    MEM_WriteInt(kdfAufnahmePtr, TRUE);                                                               // Variable
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
    MEM_WriteInt(kdfAufnahmePtr, kdfAufnahmeBak);                                                     // Variable

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
