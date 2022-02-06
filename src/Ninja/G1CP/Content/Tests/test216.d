/*
 * #216 Digger doesn't repair hut
 */
func int G1CP_Test_216() {
    const int timeToCheck = 1100;
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint("OCR_HUT_15");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("VLK_506_Buddler");
    G1CP_Testsuite_CheckPassed();

    // Backup daily routine function and current world time
    var int rtnBak; rtnBak = G1CP_NpcGetRoutine(npc);
    var int timeBak; timeBak = G1CP_GetWorldTime();

    // Set the time and daily routine
    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    Npc_ExchangeRoutine(npc, rtnName);
    var int passed; passed = STR_Compare(npc.wp, newWp.name) == STR_EQUAL;
    if (!passed) {
        G1CP_TestsuiteErrorDetailSSS("Incorrect waypoint '", npc.wp, "'");
    };

    // Back up time and daily routine
    G1CP_NpcExchangeRoutineI(npc, rtnBak);
    Wld_SetTime(timeBak / 100, timeBak % 100);

    return passed;
};
