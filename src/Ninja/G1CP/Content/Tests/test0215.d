/*
 * #215 Guy doesn't sit at arena
 */
func void G1CP_Test_0215() {
    const int timeToCheck = 1730; // Time slightly after start
    const string rtnName = "start";
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint("OCR_OUTSIDE_ARENA_BENCH2");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("VLK_530_Guy");

    G1CP_Testsuite_BackupRoutine(npc);
    G1CP_Testsuite_BackupWldTime();

    Npc_ExchangeRoutine(npc, rtnName);

    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    G1CP_Testsuite_AssertS(npc.wp, newWp.name);
};
