/*
 * #404 Spelling - Skeleton Warrior 3 (DE)
 */
func void G1CP_Test_0404() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("SummonedByNPC_SkeletonWarrior");
    G1CP_Testsuite_AssertS(npc.name, "Skelettkrieger");
};
