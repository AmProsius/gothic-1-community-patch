/*
 * #57 Misplaced texture near Gravo
 */
func void G1CP_Test_0057() {
    const string instr[2] = {
        "The hero is teleported to the Old Camp in front of the misaligned texture on the castle wall.",
        "Expected behavior: The flickering texture can't be seen anymore."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_LAKE_3"); // Waypoint with good view
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
