/*
 * #214 Graham doesn't sit at campfire
 */
func void G1CP_Test_0214() {
    const int timeToCheck = 1830; // Time slightly after start
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_HUT_77_INSERT");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("VLK_573_Graham");

    G1CP_Testsuite_BackupRoutine(npc);
    G1CP_Testsuite_BackupWldTime();

    Npc_ExchangeRoutine(npc, rtnName);

    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    G1CP_Testsuite_AssertS(npc.wp, newWp.name);
};
