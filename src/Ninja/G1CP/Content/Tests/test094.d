/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: The game is broken after the fix. Please save the game before.
 *
 * Expected behavior: The wording of the dialog option is now correct.
 */
func void G1CP_Test_094() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return; // True?
    };

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Info 'DIA_Horatio_PleaseTeachSTR' not found");
        passed = FALSE;
    };

    // Set dialog to told
    if (MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR") == -1) {
        G1CP_TestsuiteErrorDetail("Info 'DIA_Horatio_PleaseTeachSTR' not found");
        passed = FALSE;
    };

    var int varSymbPtr; varSymbPtr = MEM_GetSymbol("horatio_StrFree");
    if (!varSymbPtr) {
        G1CP_TestsuiteErrorDetail("Variable 'horatio_StrFree' not found");
        passed = FALSE;
    };
    varSymbPtr += zCParSymbol_content_offset;

    // Find Horatio
    var int symbId; symbId = MEM_GetSymbolIndex("Bau_901_Horatio");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Bau_901_Horatio' not found");
        return;
    };

    // Check if Horatio exists in the world
    var C_Npc horatio; horatio = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(horatio)) {
        G1CP_TestsuiteErrorDetail("NPC 'Bau_901_Horatio' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Set the required dialog to told
    G1CP_SetInfoTold("DIA_Horatio_PleaseTeachSTR", TRUE);

    // Set the required variable
    MEM_WriteInt(varSymbPtr, FALSE);

    // Teleport the hero to Horatio
    AI_Teleport(hero, horatio.wp);
};
