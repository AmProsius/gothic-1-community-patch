/*
 * #22 Y'Berion doesn't attack the player
 */
func void G1CP_Test_0022() {
    const string instr[2] = {
        "The game is set to chapter one and the hero is teleported to Y'Berion.",
        "Expected behavior: Y'Berion should actually attack the player."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_TEMPLE_ROOMS_05");
    var int chapterId; chapterId = G1CP_Testsuite_CheckIntVar("Kapitel");

    G1CP_SetIntI(chapterId, 0, 1);
    AI_Teleport(hero, wp.name);
};
