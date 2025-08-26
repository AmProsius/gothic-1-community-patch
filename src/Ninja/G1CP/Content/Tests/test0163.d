/*
 * #163 Castle gate of the Old Camp cannot close
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test alters the guild of the PC.
 *
 * Expected behavior: The gate properly opens and closes when using the winch.
 */
func void G1CP_Test_0163() {
    G1CP_Testsuite_CheckManual();
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCC_GATE_VWHEEL");

    // Change the player's guild to not be attacked
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Teleport the PC to the winch
    AI_Teleport(hero, wp.name);
};
