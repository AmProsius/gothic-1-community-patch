/*
 * #129 Drake has wrong body skin color
 */
func void G1CP_Test_0129() {
    const string instr[2] = {
        "The hero is teleported to the Old Mine in front of Drake to check his appearance.",
        "Expected behavior: Drake's body has the same color as his head."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_OLDMINE);
    G1CP_Testsuite_NpcBeamTo(hero, "OM_CAVE1_13A");
};
