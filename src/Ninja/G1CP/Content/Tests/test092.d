/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Be sure to save the game before.
 *
 * Expected behavior: The hero is merely teleported there, the dialog choice has the correct wording.
 */
func void G1CP_Test_092() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check language first
    if (G1CP_Lang != G1CP_Lang_DE) {
        G1CP_TestsuiteErrorDetail("Test applicable for German localization only");
        return;
    };

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    if (MEM_GetSymbolIndex("DIA_Horatio_PleaseTeachSTR") == -1) {
        G1CP_TestsuiteErrorDetail("Dialog 'DIA_Horatio_PleaseTeachSTR' not found");
        passed = FALSE;
    };

    // Check if required dialogs exist
    if (MEM_GetSymbolIndex("DIA_Horatio_Story") == -1) {
        G1CP_TestsuiteErrorDetail("Dialog 'DIA_Horatio_Story' not found");
        passed = FALSE;
    };
    if (MEM_GetSymbolIndex("DIA_Jeremiah_Horatio") == -1) {
        G1CP_TestsuiteErrorDetail("Dialog 'DIA_Jeremiah_Horatio' not found");
        passed = FALSE;
    };

    // Find the NPC
    var int symbId; symbId = MEM_GetSymbolIndex("Bau_901_Horatio");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'Bau_901_Horatio' not found");
        return; // Immediately, because there is only one more check below which will fail now anyway
    };

    // Check if the NPC exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        G1CP_TestsuiteErrorDetail("NPC 'Bau_901_Horatio' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Set unlock the dialog
    G1CP_SetInfoTold("DIA_Horatio_Hello", TRUE); // Optional
    G1CP_SetInfoTold("DIA_Horatio_Story", TRUE);
    G1CP_SetInfoTold("DIA_Jeremiah_Horatio", TRUE);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
