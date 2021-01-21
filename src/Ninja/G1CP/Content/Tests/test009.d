/*
 * #9 NPCs freeze when fleeing
 *
 * Any NPC in the area is set to the ZS_Flee state (may not work for all of them if 'other' is invalid)
 *
 * Expected behavior: The NPCs will flee from the player without freezing (might be hard to determine when the run away)
 */
func void Ninja_G1CP_Test_009() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        // AI_Teleport(hero, "PSI_TEMPLE_COURT_2"); // Clears AI queue!
        other = MEM_CpyInst(hero); // Might be dangerous!
        AI_SetNpcsToState(hero, ZS_Flee, 4000);
    };
};
