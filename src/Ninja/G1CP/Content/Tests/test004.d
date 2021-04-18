/*
 * #4 NPCs are rude to the player even after defeating them
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: Cronos (set to defeated) should say "May I pass through here?" instead of "Step aside!".
 */
func void G1CP_Test_004() {
    G1CP_Testsuite_CheckManual();
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("KDW_604_Cronos");
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("NC_PATH_AROUND_PIT_01");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC", 0);
    G1CP_Testsuite_CheckPassed();

    // Set NPC to defeated
    G1CP_NpcSetAIVarI(npc, aiVarId, TRUE);

    // Exactly in the way
    AI_Teleport(hero, wp.name);
};
