/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: ### TODO: Describe what will happen during the test ###
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("### TODO Waypoint name ###");
    /* ### TODO Optional: Add additional checks ### */
    G1CP_Testsuite_CheckPassed();

    // ### TODO Optional: Set values ###

    AI_Teleport(hero, wp.name);
};
