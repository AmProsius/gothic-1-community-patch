/*
 * #57 Misplaced texture near Gravo
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The flickering texture can't be seen anymore.
 */
func void G1CP_Test_057() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_LAKE_3");
    G1CP_Testsuite_CheckPassed();

    // Teleport the player to the wp
    AI_Teleport(hero, wp.name);
};
