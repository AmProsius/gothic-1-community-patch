/*
 * #52 MOBs in New Camp can be used without corresponding items
 */
func void G1CP_Test_0052() {
    const string instr[2] = {
        "The player is teleported in front of the fixed grindstone.",
        "Expected behavior: The grindstone is not usable anymore (without a sword blade)."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);

    Wld_SetTime(3, 0); // Get that mercenary out of the way
    G1CP_Testsuite_NpcBeamToNearestWpPosPtr(hero, _@f(G1CP_0052_UseWithItemNcGrindstone_Pos));
};
