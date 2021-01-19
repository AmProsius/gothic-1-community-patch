/*
 * #2 NPCs don't use doors properly
 *
 * The hero is teleported to the guard quarters in the morning. By default daily routines, an NPC should walk past the
 * front door (to the right of the hero). The interesting part about this fix is, whether it also works in mods, that
 * have already fixed the issue.
 *
 * Expected behavior: The NPC properly goes through the door.
 */
func void Ninja_G1CP_Test_002() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        Wld_SetTime(5, 59);
        AI_Teleport(hero, "OCC_MERCS_LEFT_ROOM_BED1");
    };
};
