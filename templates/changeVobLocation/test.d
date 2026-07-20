/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    const string instr[2] = {
        "The hero ist teleported to ### TODO Specify location. Make sure first line is unique string ###",
        "Expected behavior: ### TODO Add actions to observe ###"
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld("### TODO Affected world, default is 'WORLD' ###");

    /*### TODO Check teleport location. If bad, use G1CP_Testsuite_FindWaypoint ###*/
    G1CP_Testsuite_NpcBeamToNearestWpPosPtr(hero, _@f(G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@_PosNew));
};
