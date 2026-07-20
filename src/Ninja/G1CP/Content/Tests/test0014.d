/*
 * #14 The player can cancel fights by entering a room
 */
func void G1CP_Test_0014() {
    const string instr[6] = {
        "The hero is set to immortal and teleported near a owned hut.",
        "First, enter a room and wait for an NPC to react and to attack the PC.",
        "Leave the room (without causing them damage!). The NPC will stop the fight.",
        "Then, draw a weapon to provoke an NPC into a fight (do not damage them!). Enter and leave the nearby room.",
        "The NPC will continue the fight.",
        "Expected behavior: NPCs should stop attacking after trespassing, but continue for other offenses."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_HUT21_OUT");
    var int weapId; weapId = G1CP_Testsuite_CheckItem("ItMw_1H_Sword_Old_01");

    // Set PC to invincible to observe the action
    const int NPC_FLAG_IMMORTAL = 1 << 1;
    hero.flags = hero.flags | NPC_FLAG_IMMORTAL;

    // Supply a weapon
    if (!Npc_HasEquippedWeapon(hero))
    && (!Npc_HasReadiedWeapon(hero)) {
        CreateInvItem(hero, weapId);
        EquipWeapon(hero, weapId);
    };

    // Make sure NPCs are around
    Wld_SetTime(12, 0);
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
