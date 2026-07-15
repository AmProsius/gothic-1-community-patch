/*
 * #4 NPCs are rude to the player even after defeating them
 */
func void G1CP_Test_0004() {
    const string instr[2] = {
        "The hero is teleported to a position that blocks Cronos path. Cronos is set to defeated.",
        "Expected behavior: Cronos should say 'May I pass through here?' instead of 'Step aside!'."
    };
    G1CP_Testsuite_CheckManual(instr);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("KDW_604_Cronos");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_PATH_AROUND_PIT_01");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC");

    // Set NPC to defeated
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);

    // Exactly in the way
    Wld_SetTime(12,0);
    AI_Teleport(hero, wp.name);
};
