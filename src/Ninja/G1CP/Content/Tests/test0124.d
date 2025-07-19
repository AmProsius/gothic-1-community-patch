/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 *
 * The chapter four is started and the hero is teleported in front of castle gate.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: The castle gate should be closed (or closing?).
 */
func void G1CP_Test_0124() {
    G1CP_Testsuite_CheckManual();
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD", 0);
    const int CHAPTER_NUM = 4;
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_THORUS");
    var int fncChptrId; fncChptrId = G1CP_Testsuite_CheckFunc("B_Kapitelwechsel", "void|int", "");
    var int fncFmTakenId; fncFmTakenId = G1CP_Testsuite_CheckFunc("B_Story_FMTaken", "void|none", "");
    G1CP_Testsuite_CheckPassed();

    // First get the player away from the camp, in case Diego is still there. He would be attacked and mess up the test
    G1CP_Testsuite_NpcBeamTo(hero, "START"); // "START" is the start point, no need to check if it exists

    // Change the chapter
    MEM_PushIntParam(CHAPTER_NUM);
    MEM_CallById(fncChptrId);
    MEM_CallById(fncFmTakenId);

    // Change the player's guild to not be attacked
    hero.guild = GIL_GRD;
    Npc_SetTrueGuild(hero, GIL_GRD);

    // Teleport the PC to the castle gate
    AI_Teleport(hero, wp.name);
};
