/*
 * #401 Spelling - Skeleton Scout (DE)
 */
func void G1CP_Test_0401() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("SkeletonScout");
    G1CP_Testsuite_AssertS(npc.name, "Skelettspäher");
};
