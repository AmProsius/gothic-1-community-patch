/*
 * #213 Cauldron in the New Camp can be used without a scoop pt. 2
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The cauldron is not usable anymore (without a spoon).
 */
func void G1CP_Test_0213() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT21_OUT");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ITMISCOOP");

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Teleport the player to the MOB
    AI_Teleport(hero, wp.name);
};
