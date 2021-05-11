/*
 * #233 Spelling - Orc Dog (DE)
 */
func int G1CP_Test_233() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("OrcDog");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectNpcVariable(npc, "name", "Orkhund");
};
