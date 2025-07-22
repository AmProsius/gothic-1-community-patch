/*
 * #193 Gates triggered by switches are stuck after loading
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: The gate (that the PC is teleported to) can be opened again after closing it, saving and loading.
 */
func void G1CP_Test_0193() {
    const string ROUTINE = "OMFull";
    G1CP_Testsuite_CheckManual();
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_MAINGATE_VWHEEL");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GRD_230_Gardist");
    G1CP_Testsuite_CheckFunc("Rtn_OMFull_230", "void|none", "Daily routine function");
    G1CP_Testsuite_CheckPassed();

    // Change the routine of the NPC to leave the player alone
    Npc_ExchangeRoutine(npc, ROUTINE);

    // Teleport the player to the gate
    AI_Teleport(hero, wp.name);
};
