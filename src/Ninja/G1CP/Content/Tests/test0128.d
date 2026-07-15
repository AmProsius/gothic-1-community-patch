/*
 * #128 Guard has duplicated END dialog
 */
func void G1CP_Test_0128() {
    const string instr[3] = {
        "The hero is teleported to the guard to start a dialog.",
        "Expected behavior: The guard should only have one END dialog.",
        "Because of the world change, it's best to leave the world when continuing with more tests."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_NpcTeleportToWorld(hero, "OLDMINE.ZEN", "OM_CAVE1_16");
};
