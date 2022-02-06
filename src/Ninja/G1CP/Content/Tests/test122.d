/*
 * #122 Cavalorn WPs for his routine are reversed
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Consecutive calls of this test will alternate the time between day time and night time.
 *
 * Expected behavior: Cavalorn will be sleeping in his bed at night time and stand by the camp fire during day time.
 */
func void G1CP_Test_122() {
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wpNight; wpNight = G1CP_Testsuite_FindWaypoint("OW_SAWHUT_SLEEP_01");
    var zCWaypoint wpDay; wpDay = G1CP_Testsuite_FindWaypoint("OW_CAVALORN_01");
    G1CP_Testsuite_CheckPassed();

    // Set the time
    const int night = 0;
    night = !night;
    if (night) {
        Wld_SetTime(0, 0);
        AI_Teleport(hero, wpNight.name);
    } else {
        Wld_SetTime(12, 0);
        AI_Teleport(hero, wpDay.name);
    };
};
