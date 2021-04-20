/*
 * #110 Weird camera distance when sitting on a bench
 *
 * This test relies on manual confirmation. The PC is teleported to a bench to verify the camera distance.
 *
 * Expected behavior: The camera definition is suitable.
 */
func void G1CP_Test_110() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_MCAMP_01");
    G1CP_Testsuite_CheckPassed();

    Wld_SetTime(4, 0); // Get all the NPCs out of the way
    AI_Teleport(hero, wp.name);
};
