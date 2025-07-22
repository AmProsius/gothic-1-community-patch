/*
 * #115 Dummy Templars survive in orc graveyard
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The templars will be dead or reliably dying when walking through the orc graveyard.
 */
func void G1CP_Test_0115() {
    G1CP_Testsuite_CheckManual();

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport the player to the entrance of the orc graveyard
    G1CP_Testsuite_NpcTeleportToWorld(hero, "ORCGRAVEYARD.ZEN", "GRYD_001");
};
