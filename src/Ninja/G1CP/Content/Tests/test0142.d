/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 */
func void G1CP_Test_0142() {
    const string instr[3] = {
        "The hero is teleported to an ambient templar NPC (part 1).", // Needs to be unique!
        "Start the dialog 'Who calls the shots around here?' and observe the speakers of the subtitles.",
        "Expected behavior: The ambient templar NPC that the player is teleported to has the correct subtitles."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_GUARD2");
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
