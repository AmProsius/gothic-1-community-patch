/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 */
func void G1CP_Test_0124() {
    const string instr[3] = {
        "The hero is teleported in front of castle gate in chapter four.",
        "Observe that the guard is now able to the gate.",
        "Expected behavior: The castle gate should be closed (or closing)."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_THORUS");
    var int fncChptrId; fncChptrId = G1CP_Testsuite_CheckFunc("B_Kapitelwechsel", "void|int", "");
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    const int CHAPTER_NUM = 4;

    // Change the chapter
    MEM_PushIntParam(CHAPTER_NUM);
    MEM_CallById(fncChptrId);

    // Change the player's guild to not be attacked
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Teleport the PC to the castle gate
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
