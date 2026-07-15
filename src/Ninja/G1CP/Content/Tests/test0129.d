/*
 * #129 Drake has wrong body skin color
 */
func void G1CP_Test_0129() {
    const string instr[3] = {
        "The hero is teleported to the Old Mine in front of Drake to check his appearance.",
        "Expected behavior: Drake's body has the same color as his head.",
        "Because of the world change, it's best to leave the world when continuing with more tests."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_NpcTeleportToWorld(hero, "OLDMINE.ZEN", "OM_CAVE1_13A");
};
