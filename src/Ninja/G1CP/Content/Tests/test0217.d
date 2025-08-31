/*
 * #217 Mercenary doesn't guard the palisade
 */
func void G1CP_Test_0217() {
    const int timeToCheck = 1330; // Time slightly after start
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint("FMC_PATH19");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("SLD_750_Soeldner");

    G1CP_Testsuite_BackupRoutine(npc);
    G1CP_Testsuite_BackupWldTime();

    Npc_ExchangeRoutine(npc, rtnName);

    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    G1CP_Testsuite_AssertS(npc.wp, newWp.name);
};
