/*
 * #116 Lens flares in the swampweed cave
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: There are no lens flares in the cave.
 */
func void G1CP_Test_116() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("LOCATION_23_CAVE_1_02");
    G1CP_Testsuite_CheckPassed();
    AI_Teleport(hero, wp.name);
};
