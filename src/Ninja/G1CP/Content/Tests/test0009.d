/*
 * #9 NPCs freeze when fleeing
 */
func void G1CP_Test_0009() {
    const string instr[2] = {
        "All NPC in the area is set to the ZS_Flee state.",
        "Expected behavior: The NPCs will flee from the player without freezing."
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
    if (Npc_GetStateTime(self) > 10) { // Should be enough to observe
        return LOOP_END;
    };
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee_Loop");
};
func void ZS_G1CP_Test_0009_State_End() {
    MEM_CallByString("ZS_Flee_End");
};
