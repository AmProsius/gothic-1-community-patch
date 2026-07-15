/*
 * #110 Weird camera distance when sitting on a bench
 */
func void G1CP_Test_0110() {
    const string instr[2] = {
        "The hero teleported to a bench to verify the camera distance. Sit down and observe the camera distance.",
        "Expected behavior: The camera definition is suitable."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_HUT_71");
    AI_Teleport(hero, wp.name);
};
