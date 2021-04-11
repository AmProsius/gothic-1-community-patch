/*
 * #193 Gates triggered by switches are stuck after loading
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: The gate (that the PC is teleported to) can be opened again after closing it, saving and loading.
 */
func void G1CP_Test_193() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check status of the test
    var int passed; passed = TRUE;

    // Find the gate guard
    var int symbId; symbId = MEM_GetSymbolIndex("GRD_230_Gardist");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'GRD_230_Gardist' not found");
        return;
    };

    // Check if gate guard exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        G1CP_TestsuiteErrorDetail("NPC 'GRD_230_Gardist' not valid");
        passed = FALSE;
    };

    // Find the daily routine
    if (MEM_GetSymbolIndex("Rtn_OMFull_230") == -1) {
        G1CP_TestsuiteErrorDetail("Daily routine function 'Rtn_OMFull_230' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Change the routine of the NPC to leave the player alone
    Npc_ExchangeRoutine(npc, "OMFull");

    // Teleport the player to the gate
    AI_Teleport(hero, "OCC_MAINGATE_VWHEEL");
};
