/*
 * #56 Misplaced swamp portal
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The water will no longer be invisible at that position.
 */
func void G1CP_Test_056() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OW_PATH_BLOODFLY12_SPAWN01");
    G1CP_Testsuite_CheckPassed();

    AI_Teleport(hero, wp.name);
};
