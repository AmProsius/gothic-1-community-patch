/*
 * #122 Cavalorn WPs for his routine are reversed
 */
func void G1CP_Test_0122() {
    const int timeToCheckA = 2330; // Time slightly after start
    const int timeToCheckB = 0700;
    const string rtnName = "start";
    var zCWaypoint newWpA; newWpA = G1CP_Testsuite_FindWaypoint("OW_SAWHUT_SLEEP_01");
    var zCWaypoint newWpB; newWpB = G1CP_Testsuite_FindWaypoint("OW_CAVALORN_01");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("STT_336_Cavalorn");

    G1CP_Testsuite_BackupRoutine(npc);
    G1CP_Testsuite_BackupWldTime();

    Npc_ExchangeRoutine(npc, rtnName);

    // Check location in the evening
    Wld_SetTime(timeToCheckA / 100, timeToCheckA % 100);
    G1CP_Testsuite_AssertS(npc.wp, newWpA.name);

    // Check location in the morning
    Wld_SetTime(timeToCheckB / 100, timeToCheckB % 100);
    G1CP_Testsuite_AssertS(npc.wp, newWpB.name);
};
