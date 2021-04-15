/*
 * #217 Mercenary doesn't guard the palisade
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The mercenary will guard the palisade shortly after triggering this test.
 */
func void G1CP_Test_217() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Set time and place
    Wld_SetTime(13, 0);
    AI_Teleport(hero, "FMC_PATH19");
};
