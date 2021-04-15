/*
 * #215 Guy doesn't sit at arena
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Guy will sit down at the arena shortly after triggering this test.
 */
func void G1CP_Test_215() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Set time and place
    Wld_SetTime(17, 0);
    AI_Teleport(hero, "OCR_OUTSIDE_ARENA_BENCH2");
};
