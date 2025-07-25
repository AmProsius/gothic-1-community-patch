/*
 * #51 Chest in crypt behind wall
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: The player character will be made immortal for this test. Save the game beforehand.
 *
 * Expected behavior: The chest is now accessible.
 */
func void G1CP_Test_0051() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("LOCATION_05_02_STONEHENGE5");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to not be killed
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Teleport to the nearest waypoint
    AI_Teleport(hero, wp.name);
};
