/*
 * #229 Torch near Old Mine can't be used
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The torch is now usable.
 */
func void G1CP_Test_229() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OW_OM_ENTRANCE01");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ITLSTORCH");
    G1CP_Testsuite_CheckPassed();

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Teleport the player to the MOB
    AI_Teleport(hero, wp.name);
};
