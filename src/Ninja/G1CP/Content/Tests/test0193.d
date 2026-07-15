/*
 * #193 Gates triggered by switches are stuck after loading
 */
func void G1CP_Test_0193() {
    const string instr[2] = {
        "The hero is teleported to a gate. Operate on the switch and save and load.",
        "Expected behavior: The gate can be opened again after closing it, saving and loading."
    };
    G1CP_Testsuite_CheckManual(instr);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_MAINGATE_VWHEEL");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GRD_230_Gardist");
    G1CP_Testsuite_CheckFunc("Rtn_OMFull_230", "void|none", "Daily routine function");
    const string ROUTINE = "OMFull";

    // Change the routine of the NPC to leave the player alone
    Npc_ExchangeRoutine(npc, ROUTINE);
    AI_Teleport(hero, wp.name);
};
