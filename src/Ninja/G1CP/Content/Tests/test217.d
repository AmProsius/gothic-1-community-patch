/*
 * #217 Mercenary doesn't guard the palisade
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The mercenary will guard the palisade shortly after triggering this test.
 */
func void G1CP_Test_217() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("FMC_PATH19");
    G1CP_Testsuite_CheckPassed();

    // Set time and place
    Wld_SetTime(13, 0);
    AI_Teleport(hero, wp.name);
};
