/*
 * #136 NPCs cannot use ladders when following the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Gorn should be able to climb up the ladder to reach the PC without interruptions.
 */
func void G1CP_Test_136() {
    G1CP_Testsuite_CheckManual();
    G1CP_TeleportToWorld("FREEMINE.ZEN", "FM_20");
};
