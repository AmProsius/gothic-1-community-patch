/*
 * #60 Jesse's quest not available
 *
 * The required dialog is set to told and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int Ninja_G1CP_Test_060() {
    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Jesse_Mission_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'DIA_Jesse_Mission_Condition' not found");
        return FALSE;
    };

    // Backup values
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_Jesse_Warn"));    // Told status
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_Jesse_Mission")); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                               // Other

    // Set new values
    Ninja_G1CP_SetInfoTold("DIA_Jesse_Warn", TRUE);                                              // Told status
    Ninja_G1CP_SetInfoTold("DIA_Jesse_Mission", FALSE);                                          // Told status
    self  = MEM_CpyInst(hero);                                                                   // Self
    other = MEM_CpyInst(hero);                                                                   // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                 // Self
    other = MEM_CpyInst(othBak);                                                                 // Other
    Ninja_G1CP_SetInfoTold("DIA_Jesse_Warn", told1Bak);                                          // Told status
    Ninja_G1CP_SetInfoTold("DIA_Jesse_Mission", told2Bak);                                       // Told status

    // Check return value
    if (ret) {
        return TRUE;
    } else {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    };
};
