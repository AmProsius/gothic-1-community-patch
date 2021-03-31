/*
 * #181 Swiney gives his own pants to the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Be sure to save the game before.
 *
 * Expected behavior: The hero is merely teleported there, the dialog should work properly.
 */
func void G1CP_Test_181() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    if (MEM_GetSymbolIndex("Info_Swiney_Schuerfer") == -1) {
        G1CP_TestsuiteErrorDetail("Dialog 'Info_Swiney_Schuerfer' not found");
        passed = FALSE;
    };

    // Check if required dialogs exist
    if (MEM_GetSymbolIndex("Info_Swiney_Hello") == -1) {
        G1CP_TestsuiteErrorDetail("Dialog 'Info_Swiney_Hello' not found");
        passed = FALSE;
    };

    // Find the NPC
    var int symbId; symbId = MEM_GetSymbolIndex("SFB_1037_Swiney");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'SFB_1037_Swiney' not found");
        return; // Immediately, because there is only one more check below which will fail now anyway
    };

    // Check if the NPC exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        G1CP_TestsuiteErrorDetail("NPC 'SFB_1037_Swiney' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Set unlock the dialog
    G1CP_SetInfoTold("Info_Swiney_Hello", TRUE);
    G1CP_SetInfoTold("Info_Swiney_Schuerfer", FALSE);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
