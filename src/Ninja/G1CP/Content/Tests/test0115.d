/*
 * #115 Dummy Templars survive in orc graveyard
 */
func void G1CP_Test_0115() {
    const string instr[3] = {
        "The hero is set to immortal and teleported into the orc graveyard.",
        "Expected behavior: The templars will be dead or reliably dying when walking through the orc graveyard.",
        "Because of the world change, it's best to leave the world when continuing with more tests."
    };
    G1CP_Testsuite_CheckManual(instr);
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport the player to the entrance of the orc graveyard
    G1CP_Testsuite_NpcTeleportToWorld(hero, "ORCGRAVEYARD.ZEN", "GRYD_001");
};
