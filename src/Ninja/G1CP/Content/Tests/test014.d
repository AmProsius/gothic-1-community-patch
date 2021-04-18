/*
 * #14 The player can cancel fights by entering a room
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: NPCs should now stop attacking if their reason was trespassing, but continue for other offenses.
 */
func void G1CP_Test_014() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT21_OUT");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to observe the action
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Make sure NPCs are around
    Wld_SetTime(12, 0);

    // Teleport to a suitable spot
    AI_Teleport(hero, wp.name);
};
