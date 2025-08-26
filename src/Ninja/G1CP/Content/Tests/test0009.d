/*
 * #9 NPCs freeze when fleeing
 *
 * Any NPC in the area is set to the ZS_Flee state
 *
 * Expected behavior: The NPCs will flee from the player without freezing (might be hard to determine when the run away)
 */
func void G1CP_Test_0009() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckAiState("ZS_Flee");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("PSI_TEMPLE_COURT_2");

    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
    AI_SetNpcsToState(hero, ZS_G1CP_Test_0009_State, 4500);
};

// Wrap ZS_Flee to ensure other is valid here (AI_SetNpcsToState is supposedly buggy)
func void ZS_G1CP_Test_0009_State() {
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee");
};
func int ZS_G1CP_Test_0009_State_Loop() {
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee_Loop");
};
func void ZS_G1CP_Test_0009_State_End() {
    MEM_CallByString("ZS_Flee_End");
};
