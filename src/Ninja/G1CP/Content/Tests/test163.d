/*
 * #163 Castle gate of the Old Camp cannot close
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test alters the guild of the PC.
 *
 * Expected behavior: The gate properly opens and closes when using the winch.
 */
func void Ninja_G1CP_Test_163() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        // Define possibly missing symbols locally
        const int GIL_GRD = 2;

        // Change the player's guild to not be attacked
        hero.guild = GIL_GRD;
        Npc_SetTrueGuild(hero, GIL_GRD);

        // Teleport the PC to the winch
        AI_Teleport(hero, "OCC_GATE_VWHEEL");
    };
};
