/*
 * #226 Missing mana potion in stonehenge crypt chest
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: The potion is now in the chest.
 */
func void G1CP_Test_0226() {
    G1CP_Testsuite_CheckManual();
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItKe_Focus5");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("LOCATION_05_02_STONEHENGE4");

    // Define possibly missing symbols locally
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to not be killed
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Offer the key
    CreateInvItem(hero, itemId);

    // Teleport to the nearest waypoint
    AI_Teleport(hero, wp.name);
};
