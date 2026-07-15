/*
 * #2 NPCs don't use doors properly
 */
func void G1CP_Test_0002() {
    const string instr[3] = {
        "The hero is teleported to the guard quarters in the morning.",
        "By default daily routines, an NPC should walk through the front door (to the right of the hero).",
        "Expected behavior: The NPC is able to open the door and properly go through the door."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_MERCS_LEFT_ROOM_BED1");
    Wld_SetTime(5, 59);
    AI_Teleport(hero, wp.name);
};
