/*
 * #9 NPCs freeze when fleeing
 *
 * Any NPC in the area is set to the ZS_Flee state
 *
 * Expected behavior: The NPCs will flee from the player without freezing (might be hard to determine when the run away)
 */
func void G1CP_Test_009() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    var int symbId; symbId = MEM_FindParserSymbol("ZS_Flee");
    if (MEM_FindParserSymbol("ZS_Flee") == -1)
    || (MEM_FindParserSymbol("ZS_Flee_Loop") == -1)
    || (MEM_FindParserSymbol("ZS_Flee_End") == -1) {
        G1CP_TestsuiteErrorDetail("AI state 'ZS_Flee' (or sub-functions) not found");
        return;
    };

    // AI_Teleport(hero, "PSI_TEMPLE_COURT_2"); // Clears AI queue!
    AI_SetNpcsToState(hero, ZS_G1CP_Test_009_State, 4500);
};

// Wrap ZS_Flee to ensure other is valid here (AI_SetNpcsToState is supposedly buggy)
func void ZS_G1CP_Test_009_State() {
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee");
};
func int ZS_G1CP_Test_009_State_Loop() {
    Npc_SetTarget(self, hero);
    Npc_GetTarget(self);
    MEM_CallByString("ZS_Flee_Loop");
};
func void ZS_G1CP_Test_009_State_End() {
    MEM_CallByString("ZS_Flee_End");
};
