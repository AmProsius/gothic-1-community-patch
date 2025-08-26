/*
 * #212 Cauldron in the New Camp can be used without a scoop pt. 1
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The cauldron is not usable anymore (without a spoon).
 */
func void G1CP_Test_0212() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT13_OUT");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ITMISCOOP");

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Get that rogue out of the way
    Wld_SetTime(3, 0);

    // Teleport the player to the MOB
    AI_Teleport(hero, wp.name);
};
