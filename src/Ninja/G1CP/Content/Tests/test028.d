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
    var int symbId; symbId = MEM_FindParserSymbol("Org_826_Mordrag_GotoNewcamp_Condition");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
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

    // Set new values
    MEM_WriteInt(hauAbPtr, TRUE);                                                                        // Variable
    Ninja_G1CP_SetInfoTold("Org_826_Mordrag_JoinNewcamp", TRUE);                                         // Told status

    // Call dialog condition function
    MEM_CallByID(symbId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
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
