/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func int G1CP_Test_@ISSUE_NUM_PAD@() {
    const string instr[2] = {
        "The hero ist teleported to ### TODO Specify location. Make sure first line is unique string ###",
        "Expected behavior: ### TODO Add actions to observe ###"
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld("### TODO Affected world, default is 'WORLD' ###");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("### TODO Waypoint name ###");
    /*### TODO Add additional checks ###*/

    /*### TODO Set values ###*/

    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
