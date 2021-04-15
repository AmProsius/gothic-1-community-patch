/*
 * #4 NPCs are rude to the player even after defeating them
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: Cronos (set to defeated) should say "May I pass through here?" instead of "Step aside!".
 */
func void G1CP_Test_004() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Define constants for specific test
    const string AI_VAR_NAME = "AIV_WASDEFEATEDBYSC";

    // Prior checks
    G1CP_Testsuite_CheckIntConst(AI_VAR_NAME, 0);
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("KDW_604_Cronos");
    G1CP_Testsuite_CheckPassed();

    // Set NPC to defeated
    G1CP_NpcSetAIVar(npc, AI_VAR_NAME, TRUE);

    // Exactly in the way
    AI_Teleport(hero, "NC_PATH_AROUND_PIT_01");
};
