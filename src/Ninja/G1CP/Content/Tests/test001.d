/*
 * #1 NPCs wake up immediately
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: NPCs should be able to sleep.
 */
func void G1CP_Test_001() {
    if (G1CP_TestsuiteAllowManual) {
        Wld_SetTime(0, 0);
        AI_Teleport(hero, "PSI_PATH_11_5");
    };
};
