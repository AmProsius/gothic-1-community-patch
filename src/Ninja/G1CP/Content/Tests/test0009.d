/*
 * #9 NPCs freeze when fleeing
 */
func void G1CP_Test_0009() {
    const string instr[3] = {
        "All NPCs in the area is set to the ZS_Flee state.",
        "Observe the NPCs for at least 10 to 15 seconds. When partially out of sight, they stop and turn to the PC.",
        "Expected behavior: The NPCs flee from the PC and instead of freezing they turn to him when out of sight."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    G1CP_Testsuite_CheckAiState("ZS_Flee");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_TEMPLE_COURT_2");
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
    AI_Wait(hero, 4); // Give time for spawn
    AI_SetNpcsToState(hero, ZS_G1CP_Test_0009_State, 4500);
};

// Wrap ZS_Flee to ensure other is valid here (AI_SetNpcsToState is supposedly buggy)
func void ZS_G1CP_Test_0009_State() {
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee");
    // Override attitude to allow further tests without interruption
    Npc_SetTempAttitude(self, ATT_NEUTRAL);
};
func int ZS_G1CP_Test_0009_State_Loop() {
    if (Npc_GetStateTime(self) > 20) { // Should be enough to observe
        return LOOP_END;
    };
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee_Loop");
    return MEM_PopIntResult();
};
func void ZS_G1CP_Test_0009_State_End() {
    MEM_CallByString("ZS_Flee_End");
};
