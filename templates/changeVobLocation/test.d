/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: ### TODO Describe what will happen during the test ###
 */
func void G1CP_Test_{ISSUE_NUM_PAD}() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckPassed();

    // ### TODO Check teleport location. If bad, use G1CP_Testsuite_FindWaypoint and AI_Teleport ###
    G1CP_Testsuite_NpcBeamToNearestWpPosPtr(hero, _@f(G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}_PosNew));
};
