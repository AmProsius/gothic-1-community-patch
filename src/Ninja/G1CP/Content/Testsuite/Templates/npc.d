/*
 * Test the updated waypoint name in an NPC routine.
 * The 'rtnName' is expected raw, i.e. without 'Rtn_*_ID' prefix and suffix.
 * A necessary call to 'G1CP_Testsuite_CheckWorld' is not part of this function to allow additional world-dependent
 * checks. Calling 'G1CP_Testsuite_CheckWorld' is required before calling this function!
 */
func void G1CP_Tpl_TestNpcRtnWP(var string correctWpName, var string npcName, var string rtnName, var int timeToCheck) {
    var zCWaypoint newWp; newWp = G1CP_Testsuite_FindWaypoint(correctWpName);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc(npcName);

    G1CP_Testsuite_BackupRoutine(npc);
    G1CP_Testsuite_BackupWldTime();

    Npc_ExchangeRoutine(npc, rtnName);
    Wld_SetTime(timeToCheck / 100, timeToCheck % 100);
    G1CP_Testsuite_Assert(G1CP_NpcIsInRoutine(npc, rtnName), TRUE);
    G1CP_Testsuite_AssertS(npc.wp, newWp.name);
};
