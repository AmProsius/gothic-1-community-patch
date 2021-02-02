/*
 * #40 Aleph's key dialog doesn't disappear
 *
 * The necessary dialogs including the one from the new condition are set to told and the dialog function is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_040() {
    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("VLK_585_Aleph_DIRTY_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog function 'VLK_585_Aleph_DIRTY_Condition' not found");
        return FALSE;
    };

    // Backup values
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("GRD_271_ULBERT_DRUNK"));   // Told status
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("GRD_261_Brandick_ALEPH")); // Told status
    var int told3Bak; told3Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("VLK_585_Aleph_SCHUPPEN")); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                     // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                                    // Other

    // Set new values
    Ninja_G1CP_SetInfoTold("GRD_271_ULBERT_DRUNK", TRUE);                                             // Told status
    Ninja_G1CP_SetInfoTold("GRD_261_Brandick_ALEPH", TRUE);                                           // Told status
    Ninja_G1CP_SetInfoTold("VLK_585_Aleph_SCHUPPEN", TRUE);                                           // Told status
    self  = MEM_NullToInst();                                                                         // Self
    other = MEM_CpyInst(hero);                                                                        // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                      // Self
    other = MEM_CpyInst(othBak);                                                                      // Other
    Ninja_G1CP_SetInfoTold("GRD_271_ULBERT_DRUNK", told1Bak);                                         // Told status
    Ninja_G1CP_SetInfoTold("GRD_261_Brandick_ALEPH", told2Bak);                                       // Told status
    Ninja_G1CP_SetInfoTold("VLK_585_Aleph_SCHUPPEN", told3Bak);                                       // Told status

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
