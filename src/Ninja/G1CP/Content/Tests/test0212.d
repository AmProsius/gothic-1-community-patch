/*
 * #212 Cauldron in the New Camp can be used without a scoop pt. 1
 */
func void G1CP_Test_0212() {
    const string instr[3] = {
        "The hero is teleported to a faulty cauldron. (part 1)", // Needs to be unique!
        "Interact with the cauldron without the now necessary item.",
        "Expected behavior: The cauldron is not usable anymore (without a spoon)."
    };
    G1CP_Testsuite_CheckManual(instr);
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
