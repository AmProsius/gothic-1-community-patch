/*
 * #58 Player can decelerate falls by fight actions in mid-air
 */
func void G1CP_Test_0058() {
    const string instr[2] = {
        "The hero is set to immortal and is teleported on a high point to jump off of.",
        "Expected behavior: The player should no longer be able to intercept falling by blocking."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);

    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    Npc_SetToFistMode(hero);
    G1CP_Testsuite_NpcBeamToPosF(hero, -5055.20459, 3906.66333, -3661.51001);
};
