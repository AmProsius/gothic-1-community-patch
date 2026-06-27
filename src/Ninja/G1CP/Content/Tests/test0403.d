/*
 * #403 Spelling - Skeleton Warrior 2 (DE)
 */
func void G1CP_Test_0403() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("SummonedByPC_SkeletonWarrior");
    G1CP_Testsuite_AssertS(npc.name, "Skelettkrieger");
};
