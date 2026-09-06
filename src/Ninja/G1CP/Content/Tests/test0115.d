/*
 * #115 Dummy Templars survive in orc graveyard
 */
func void G1CP_Test_0115() {
    const string instr[2] = {
        "The hero is set to immortal and teleported into the orc graveyard.",
        "Expected behavior: The templars will be dead or reliably dying when walking through the orc graveyard."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_ORCGRAVEYARD);

    // Set PC to invincible to observe the action
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport the player to the entrance of the orc graveyard
    G1CP_Testsuite_NpcBeamTo(hero, "");
};
