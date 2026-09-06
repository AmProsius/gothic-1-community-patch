/*
 * #22 Y'Berion doesn't attack the player
 */
func void G1CP_Test_0022() {
    const string instr[2] = {
        "The game is set to chapter one and the hero is teleported to Y'Berion.",
        "Expected behavior: Y'Berion should actually attack the player."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_TEMPLE_ROOMS_05");
    var int chapterId; chapterId = G1CP_Testsuite_CheckIntVar("Kapitel");

    // Set PC to invincible to observe the action
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    G1CP_SetIntI(chapterId, 0, 1);
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
