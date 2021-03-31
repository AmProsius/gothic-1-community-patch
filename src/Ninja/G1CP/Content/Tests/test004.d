/*
 * #4 NPCs are rude to the player even after defeating them
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test breaks the game. Save the game beforehand.
 *
 * Expected behavior: Cronos (set to defeated) should say "May I pass through here?" instead of "Step aside!".
 */
func void G1CP_Test_004() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check status of the test
    var int passed; passed = TRUE;

    // Find AI variable
    if (MEM_GetSymbolIndex("AIV_WasDefeatedBySC") == -1) {
        G1CP_TestsuiteErrorDetail("Variable 'AIV_WasDefeatedBySC' not found");
        passed = FALSE;
    };

    // Find the NPC
    var int symbId; symbId = MEM_GetSymbolIndex("KDW_604_Cronos");
    if (symbId == -1) {
        G1CP_TestsuiteErrorDetail("NPC 'KDW_604_Cronos' not found");
        return; // Immediately, because there is only one more check below which will fail now anyway
    };

    // Check if the NPC exists in the world
    var C_Npc npc; npc = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(npc)) {
        G1CP_TestsuiteErrorDetail("NPC 'KDW_604_Cronos' not valid");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return;
    };

    // Set NPC to defeated
    G1CP_SetAIVar(npc, "AIV_WasDefeatedBySC", TRUE);

    // Exactly in the way
    AI_Teleport(hero, "NC_PATH_AROUND_PIT_01");
};
