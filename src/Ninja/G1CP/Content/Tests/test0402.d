/*
 * #402 Spelling - Skeleton Warrior (DE)
 */
func void G1CP_Test_0402() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("### TODO NPC instance ###");
    G1CP_Testsuite_AssertS(npc.name, "### TODO Correct name ###");
};
