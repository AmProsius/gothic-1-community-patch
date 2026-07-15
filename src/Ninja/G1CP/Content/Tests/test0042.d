/*
 * #42 Guard has duplicated END dialog
 */
func void G1CP_Test_0042() {
    const string instr[2] = {
        "The hero is teleported to the front of the guard to the left of the ore barons' house.",
        "Expected behavior: The guard at the door (left) to the ore barons house should only have one END dialog."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_BARONS_LEFT_GUARD_CHANGE");
    AI_Teleport(hero, wp.name);
};
