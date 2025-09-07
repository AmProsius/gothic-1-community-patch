/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    const string npcName = "### TODO: NPC name ###";
    const string correctedWpName = "### TODO: Corrected waypoint name ###";
    const int timeToCheck = 2330; // ### TODO: Time slightly after start ###
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint(correctedWpName);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc(npcName);

    // Backup daily routine function and current world time
    var int rtnBak; rtnBak = G1CP_NpcGetRoutine(npc);
    var int timeBak; timeBak = G1CP_GetWorldTime();

    // Set the time and daily routine
    Npc_ExchangeRoutine(npc, rtnName);
    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    var int passed; passed = STR_Compare(npc.wp, newWp.name) == STR_EQUAL;
    if (!passed) {
        G1CP_TestsuiteErrorDetail3("Incorrect waypoint '", npc.wp, "'");
    };

    // Restore time and daily routine
    G1CP_NpcExchangeRoutineI(npc, rtnBak);
    Wld_SetTime(timeBak / 100, timeBak % 100);

    return passed;
};
