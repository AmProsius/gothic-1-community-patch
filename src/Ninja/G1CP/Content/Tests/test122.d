/*
 * #122 Cavalorn WPs for his routine are reversed
 */
func int G1CP_Test_122() {
    const int timeToCheckA = 2330; // Time slightly after start
    const int timeToCheckB = 0700;
    const string rtnName = "start";
    var zCWaypoint newWpA; newWpA = G1CP_Testsuite_FindWaypoint("OW_SAWHUT_SLEEP_01");
    var zCWaypoint newWpB; newWpB = G1CP_Testsuite_FindWaypoint("OW_CAVALORN_01");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("STT_336_Cavalorn");
    G1CP_Testsuite_CheckPassed();

    // Backup daily routine function and current world time
    var int rtnBak; rtnBak = G1CP_NpcGetRoutine(npc);
    var int timeBak; timeBak = G1CP_GetWorldTime();

    // Start routine to check
    var int passed; passed = TRUE;
    Npc_ExchangeRoutine(npc, rtnName);

    // A: Set the time and daily routine
    Wld_SetTime(timeToCheckA / 100, timeToCheckA % 100);
    if (STR_Compare(npc.wp, newWpA.name) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSS("Incorrect waypoint '", npc.wp, "' (first pass)");
        passed = FALSE;
    };

    // B: Set the time and daily routine
    Wld_SetTime(timeToCheckB / 100, timeToCheckB % 100);
    if (STR_Compare(npc.wp, newWpB.name) != STR_EQUAL) {
        G1CP_TestsuiteErrorDetailSSS("Incorrect waypoint '", npc.wp, "' (second pass)");
        passed = FALSE;
    };

    // Restore time and daily routine
    G1CP_NpcExchangeRoutineI(npc, rtnBak);
    Wld_SetTime(timeBak / 100, timeBak % 100);

    return passed;
};
