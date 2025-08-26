/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The ambient templar NPC that the player is teleported to has the correct subtitles.
 */
func void G1CP_Test_0142() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_GUARD2");

    AI_Teleport(hero, wp.name);
};
