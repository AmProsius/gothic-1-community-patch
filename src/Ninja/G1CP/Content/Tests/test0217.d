/*
 * #217 Mercenary doesn't guard the palisade
 */
func int G1CP_Test_0217() {
    const int timeToCheck = 1330; // Time slightly after start
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint("FMC_PATH19");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("SLD_750_Soeldner");
    G1CP_Testsuite_CheckPassed();

    // Backup daily routine function and current world time
    var int rtnBak; rtnBak = G1CP_NpcGetRoutine(npc);
    var int timeBak; timeBak = G1CP_GetWorldTime();

    // Set the time and daily routine
    Npc_ExchangeRoutine(npc, rtnName);
    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    var int passed; passed = STR_Compare(npc.wp, newWp.name) == STR_EQUAL;
    if (!passed) {
        G1CP_TestsuiteErrorDetailSSS("Incorrect waypoint '", npc.wp, "'");
    };

    // Restore time and daily routine
    G1CP_NpcExchangeRoutineI(npc, rtnBak);
    Wld_SetTime(timeBak / 100, timeBak % 100);

    return passed;
};
