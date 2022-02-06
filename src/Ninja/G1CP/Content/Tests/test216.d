/*
 * #216 Digger doesn't repair hut
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The Digger will repair his hut shortly after triggering this test.
 */
func void G1CP_Test_216() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_HUT_15");
    G1CP_Testsuite_CheckPassed();

    // Set time and place
    Wld_SetTime(11, 0);
    AI_Teleport(hero, wp.name);
};
