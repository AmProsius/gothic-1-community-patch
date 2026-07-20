/*
 * #212 Cauldron in the New Camp can be used without a scoop pt. 1
 */
func void G1CP_Test_0212() {
    const string instr[3] = {
        "The hero is teleported to a faulty cauldron with the spoon item. (part 1)", // Needs to be unique!
        "Interact with the cauldron with the item, than drop the spoon from the inventory and try again.",
        "Expected behavior: The cauldron is not usable anymore (without a spoon)."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT13_OUT");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ITMISCOOP");

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Get that rogue out of the way
    Wld_SetTime(3, 0);

    // Teleport the player to the MOB
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
