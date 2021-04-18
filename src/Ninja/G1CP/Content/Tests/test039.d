/*
 * #39 Fingers teaches advanced skills too soon
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The hero is merely teleported to Fletcher, the available dialog choices should match the skills.
 */
func void G1CP_Test_039() {
    G1CP_Testsuite_CheckManual();

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Fingers_Lehrer_Info");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog function 'DIA_Fingers_Lehrer_Info' not found");
        passed = FALSE;
    };

    // Find Fingers
    var int symbId; symbId = MEM_GetSymbolIndex("STT_331_Fingers");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'STT_331_Fingers' not found");
        passed = FALSE;
    };

    // Check if Fingers exists in the world
    var C_Npc fingers; fingers = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(fingers)) {
        G1CP_TestsuiteErrorDetail("NPC 'STT_331_Fingers' not valid");
        passed = FALSE;
    };

    // Check if variable exists
    var int canTeachPtr; canTeachPtr = MEM_GetSymbol("Fingers_CanTeach");
    if (!canTeachPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'Fingers_CanTeach' not found");
        passed = FALSE;
    };
    canTeachPtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Set unlock the dialog
    MEM_WriteInt(canTeachPtr, TRUE);

    // Teleport the hero to Silas
    AI_Teleport(hero, fingers.wp);
};
