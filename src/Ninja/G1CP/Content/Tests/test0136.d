/*
 * #136 NPCs cannot use ladders when following the player
 */
func void G1CP_Test_0136() {
    const string instr[4] = {
        "The hero is teleported into the Free Mine in front of a ladder.",
        "Climb up the ladder and observe Gorn following.",
        "Expected behavior: Gorn should be able to climb up the ladder to reach the PC without interruptions.",
        "Because of the world change, it's best to leave the world when continuing with more tests."
    };
    G1CP_Testsuite_CheckManual(instr);
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");

    // Change the player's guild to not be attacked
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    G1CP_Testsuite_NpcTeleportToWorld(hero, "FREEMINE.ZEN", "FM_20");
};
