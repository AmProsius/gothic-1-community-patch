/*
 * #127 One chest in NC cannot be opened
 */
func void G1CP_Test_0127() {
    const string instr[3] = {
        "The hero is teleported in front of a disfunct chest.",
        "Open the chest with the provided lockpick.",
        "Expected behavior: The chest can be picked with the combination 'LRL'."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT28_IN");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ITKELOCKPICK");

    // Reset the hero's guild to be sure
    const int GIL_NONE = 0; GIL_NONE = G1CP_GetIntConst("GIL_NONE", 0);
    hero.guild = GIL_NONE;

    // Give the player an item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Teleport the player to the hut
    AI_Teleport(hero, wp.name);
};
