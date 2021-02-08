/*
 * #8 NPCs move in circles
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: NPCs should no longer move in circles.
 */
func void Ninja_G1CP_Test_008() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        // No idea where this bug is actually visible
        Wld_SetTime(11, 0); // TODO
        AI_Teleport(hero, "OCR_OUTSIDE_MCAMP_01"); // TODO
    };
};
