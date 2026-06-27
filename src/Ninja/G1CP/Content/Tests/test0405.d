/*
 * #405 Spelling - Goblin Warrior (DE)
 */
func void G1CP_Test_0405() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("BlackGobboWarrior");
    G1CP_Testsuite_AssertS(npc.name, "Goblinkrieger");
};
