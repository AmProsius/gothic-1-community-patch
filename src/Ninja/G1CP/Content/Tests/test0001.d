/*
 * #1 NPCs wake up immediately
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: NPCs should be able to sleep.
 */
func void G1CP_Test_0001() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_PATH_11_5");
    G1CP_Testsuite_CheckPassed();

    Wld_SetTime(0, 0);
    AI_Teleport(hero, wp.name);
};
