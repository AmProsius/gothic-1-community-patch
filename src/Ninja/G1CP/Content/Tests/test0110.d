/*
 * #110 Weird camera distance when sitting on a bench
 */
func void G1CP_Test_0110() {
    const string instr[2] = {
        "The hero teleported to a bench to verify the camera distance. Sit down and observe the camera distance.",
        "Expected behavior: The camera definition is suitable."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_HUT_71");
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
