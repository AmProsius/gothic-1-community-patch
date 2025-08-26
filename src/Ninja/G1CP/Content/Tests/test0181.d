/*
 * #181 Swiney gives his own pants to the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Be sure to save the game before.
 *
 * Expected behavior: The hero is merely teleported there, the dialog should work properly.
 */
func void G1CP_Test_0181() {
    G1CP_Testsuite_CheckManual();
    var int helloId; helloId = G1CP_Testsuite_CheckInfo("Info_Swiney_Hello");
    var int diggerId; diggerId = G1CP_Testsuite_CheckInfo("Info_Swiney_Schuerfer");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("SFB_1037_Swiney");

    // Set unlock the dialog
    G1CP_SetInfoToldI(helloId, TRUE);
    G1CP_SetInfoToldI(diggerId, FALSE);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
