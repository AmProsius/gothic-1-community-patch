/*
 * #28 Mordrag doesn't refuse to escort the player
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_028() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Org_826_Mordrag_GotoNewcamp_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
        passed = FALSE;
    };

    // Find Mordrag
    var int symbId; symbId = MEM_FindParserSymbol("ORG_826_Mordrag");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'ORG_826_Mordrag' not found");
        passed = FALSE;
    };

    // Check if Mordrag exists in the world
    var C_Npc mordrag; mordrag = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(mordrag)) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'ORG_826_Mordrag' is not a valid NPC");
        passed = FALSE;
    };

    // Check if variable exists
    var int hauAbPtr; hauAbPtr = MEM_GetSymbol("MordragKO_HauAb");
    if (!hauAbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'MordragKO_HauAb' not found");
        passed = FALSE;
    };
    hauAbPtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int hauAbBak; hauAbBak = MEM_ReadInt(hauAbPtr);                                                  // Variable
    var int toldBak; toldBak = Npc_KnowsInfo(hero, MEM_FindParserSymbol("Org_826_Mordrag_JoinNewcamp")); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                                        // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                                       // Other

    // Set new values
    MEM_WriteInt(hauAbPtr, TRUE);                                                                        // Variable
    Ninja_G1CP_SetInfoTold("Org_826_Mordrag_JoinNewcamp", TRUE);                                         // Told status
    self  = MEM_CpyInst(mordrag);                                                                        // Self
    other = MEM_CpyInst(hero);                                                                           // Other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                                         // Self
    other = MEM_CpyInst(othBak);                                                                         // Other
    MEM_WriteInt(hauAbPtr, hauAbBak);                                                                    // Variable
    Ninja_G1CP_SetInfoTold("Org_826_Mordrag_JoinNewcamp", toldBak);                                      // Told status

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
