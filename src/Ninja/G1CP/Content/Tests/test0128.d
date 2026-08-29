/*
 * #128 Guard has duplicated END dialog
 */
func void G1CP_Test_0128() {
    const string instr[2] = {
        "The hero is teleported to the guard to start a dialog.",
        "Expected behavior: The guard should only have one END dialog."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_OLDMINE);
    G1CP_Testsuite_NpcBeamTo(hero, "OM_CAVE1_16");
};
