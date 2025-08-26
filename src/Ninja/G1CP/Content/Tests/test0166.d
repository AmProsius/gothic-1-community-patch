/*
 * #166 Ambient dialogs of rogue not available
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The new ambient dialogs should be available after giving the organizator a joint.
 */
func void G1CP_Test_0166() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OW_PATH_07_21_GUARD_RIGHT");
    var int joint1Id; joint1Id = G1CP_Testsuite_CheckItem("ItMiJoint_1");
    var int joint2Id; joint2Id = G1CP_Testsuite_CheckItem("ItMiJoint_2");
    var int joint3Id; joint3Id = G1CP_Testsuite_CheckItem("ItMiJoint_3");

    // Give the player an item to check
    if (!Npc_HasItems(hero, joint1Id)) {
        CreateInvItem(hero, joint1Id);
    };
    if (!Npc_HasItems(hero, joint2Id)) {
        CreateInvItem(hero, joint2Id);
    };
    if (!Npc_HasItems(hero, joint3Id)) {
        CreateInvItem(hero, joint3Id);
    };

    // Teleport the player to the hut
    AI_Teleport(hero, wp.name);
};
