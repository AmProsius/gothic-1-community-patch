/*
 * #51 Chest in crypt behind wall
 */
func void G1CP_Test_0051() {
    const string instr[3] = {
        "The hero is set to immortal and teleported to the crypt.",
        "Check if there are two chests now, i.e. one of them is no longer behind the wall.",
        "Expected behavior: The chest is now accessible."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);

    // Set PC to invincible to not be killed
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    G1CP_Testsuite_NpcBeamToNearestWpPosPtr(hero, _@f(G1CP_0051_StonehengeCryptChest_PosNew));
};
