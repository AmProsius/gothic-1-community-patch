/*
 * #1 NPCs wake up immediately
 */
func void G1CP_Test_0001() {
    const string instr[2] = {
        "Wait for the NPCs to go to bed.",
        "Expected behavior: The NPCs should be able to sleep."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_PATH_11_5");
    Wld_SetTime(0, 0);
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
