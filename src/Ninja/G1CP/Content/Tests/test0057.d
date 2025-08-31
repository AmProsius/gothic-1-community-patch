/*
 * #57 Misplaced texture near Gravo
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The flickering texture can't be seen anymore.
 */
func void G1CP_Test_0057() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_LAKE_3"); // Waypoint with good view
    AI_Teleport(hero, wp.name);
};
