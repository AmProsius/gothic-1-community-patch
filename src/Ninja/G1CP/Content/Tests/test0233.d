/*
 * #233 Spelling - Orc Dog (DE)
 */
func int G1CP_Test_0233() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("OrcDog");

    return G1CP_Testsuite_InspectNpcString(npc, "name", "Orkhund");
};
