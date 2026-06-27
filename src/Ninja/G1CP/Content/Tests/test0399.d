/*
 * #399 Spelling - Skeleton Mage (DE)
 */
func void G1CP_Test_0399() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("SkeletonMage");
    G1CP_Testsuite_AssertS(npc.name, "Skelettmagier");
};
