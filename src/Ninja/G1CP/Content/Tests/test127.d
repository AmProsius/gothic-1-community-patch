/*
 * #127 One chest in NC cannot be opened
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The cauldron is not usable anymore (without a spoon).
 */
func void G1CP_Test_127() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT28_OUT");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("itkelockpick");
    G1CP_Testsuite_CheckPassed();

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Teleport the player to the MOB
    AI_Teleport(hero, wp.name);
};
