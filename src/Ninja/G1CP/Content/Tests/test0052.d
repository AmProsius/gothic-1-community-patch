/*
 * #52 MOBs in New Camp can be used without corresponding items
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The grindstone is not usable anymore (without a sword blade).
 */
func void G1CP_Test_0052() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT03_OUT_MOVEMENT");

    // Get that mercenary out of the way
    Wld_SetTime(3, 0);

    // Teleport to the nearest waypoint
    AI_Teleport(hero, wp.name);
};
