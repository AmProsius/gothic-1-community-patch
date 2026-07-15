/*
 * #163 Castle gate of the Old Camp cannot close
 */
func void G1CP_Test_0163() {
    const string instr[3] = {
        "The hero's guild is changed and the hero is teleported to the gate wheel.",
        "Operate the switch and observe the gate.",
        "Expected behavior: The gate properly opens and closes when using the winch."
    };
    G1CP_Testsuite_CheckManual(instr);
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_GATE_VWHEEL");

    // Change the player's guild to not be attacked
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Teleport the PC to the winch
    AI_Teleport(hero, wp.name);
};
