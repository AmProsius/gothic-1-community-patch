/*
 * #261 Spelling - Orc Hunter (DE)
 */
func void G1CP_Test_0261() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("OrcScout");
    G1CP_Testsuite_AssertS(npc.name, "Ork-Jäger");
};
