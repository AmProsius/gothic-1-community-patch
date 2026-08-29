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

/*
 * Test the updated integer variable (e.g. id, voice, etc.) of an NPC.
 */
func void G1CP_Tpl_TestNpcIntVar(var string npcInstName, var string prop, var int correctVal) {
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc(npcInstName);
    G1CP_Testsuite_Assert(G1CP_Testsuite_GetInstIntVar(npc, prop), correctVal);
};

/*
 * Test the updated string variable (e.g. name, wp, etc.) of an NPC.
 */
func void G1CP_Tpl_TestNpcStringVar(var string npcInstName, var string prop, var string correctStr) {
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc(npcInstName);
    G1CP_Testsuite_AssertS(G1CP_Testsuite_GetInstStringVar(npc, prop), correctStr);
};
