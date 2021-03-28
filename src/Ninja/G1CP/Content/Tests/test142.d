/*
 * #142 Dialog lines with ambient templar interchanged pt. 1
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The ambient templar NPC that the player is teleported to has the correct subtitles.
 */
func void G1CP_Test_142() {
    if (G1CP_TestsuiteAllowManual) {
        AI_Teleport(hero, "PSI_GUARD2");
    };
};
