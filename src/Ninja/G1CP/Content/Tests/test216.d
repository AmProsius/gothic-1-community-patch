/*
 * #216 Digger doesn't repair hut
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The Digger will repair his hut shortly after triggering this test.
 */
func void G1CP_Test_216() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };
    
    // Set time and place
    Wld_SetTime(11, 0);
    AI_Teleport(hero, "OCR_HUT_15");
};
