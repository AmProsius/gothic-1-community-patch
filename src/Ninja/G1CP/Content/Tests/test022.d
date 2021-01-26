/*
 * #22 Y'Berion doesn't attack the player
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * This test only works in chapter one of the game
 *
 * Expected behavior: Y'Berion should attack the player
 */
func void Ninja_G1CP_Test_022() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        AI_Teleport(hero, "PSI_TEMPLE_ROOMS_05");
    };
};
