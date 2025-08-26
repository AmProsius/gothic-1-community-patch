/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: ### TODO: Describe what will happen during the test ###
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace waypoint name of "WAYPOINT_NAME" ###
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("WAYPOINT_NAME");
    /* ### TODO: Optional: Add additional checks ### */

    // ### TODO: Optional: Set values ###

    AI_Teleport(hero, wp.name);
};
