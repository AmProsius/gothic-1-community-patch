/*
 * #244 Guard has duplicated END dialog
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Both guards at the door to the ore barons house should only have one END dialog.
 */
func void G1CP_Test_0244() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_BARONS_RIGHT_GUARD_CHANGE");
    G1CP_Testsuite_CheckPassed();

    AI_Teleport(hero, wp.name);
};
