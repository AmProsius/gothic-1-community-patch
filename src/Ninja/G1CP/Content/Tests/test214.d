/*
 * #214 Graham doesn't sit at campfire
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: Graham will sit down by the campfire shortly (one game minute) after triggering this test.
 */
func void G1CP_Test_214() {
    if (G1CP_TestsuiteAllowManual) {
        // Shut up Bloodwyn
        G1CP_SetIntVar("Bloodwyn_PayDay", 0, Wld_GetDay()+1);
        G1CP_SetInfoTold("Info_Bloodwyn_Hello", TRUE);

        // Set time and place
        Wld_SetTime(18, 0);
        AI_Teleport(hero, "OCR_OUTSIDE_HUT_77_MOVEMENT");
    };
};
