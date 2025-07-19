/*
 * #22 Y'Berion doesn't attack the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * This test only works in chapter one of the game
 *
 * Expected behavior: Y'Berion should attack the player
 */
func void G1CP_Test_0022() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_TEMPLE_ROOMS_05");
    G1CP_Testsuite_CheckPassed();

    AI_Teleport(hero, wp.name);
};
