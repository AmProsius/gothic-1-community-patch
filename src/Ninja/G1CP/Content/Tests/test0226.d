/*
 * #226 Missing mana potion in stonehenge crypt chest
 */
func void G1CP_Test_0226() {
    const string instr[3] = {
        "The hero is set to immortal and teleported to the chest in the stonehenge crypt.",
        "Open the chest and check its contents. The hero has the key in the inventory.",
        "Expected behavior: The potion is now in the chest."
    };
    G1CP_Testsuite_CheckManual(instr);
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItKe_Focus5");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("LOCATION_05_02_STONEHENGE4");
    const int NPC_FLAG_IMMORTAL = 1 << 1;

    // Set PC to invincible to not be killed
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Offer the key
    CreateInvItem(hero, itemId);

    // Teleport to the nearest waypoint
    AI_Teleport(hero, wp.name);
};
