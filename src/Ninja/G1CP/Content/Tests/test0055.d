/*
 * #55 Reactivate In Extremo concert
 */
func void G1CP_Test_0055() {
    const string instr[2] = {
        "The hero is teleported in front of the stage in the Old Camp in chapter 2.",
        "Expected behavior: InExtremo is playing and Grim (if available) will talk to the player about it."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_THORUS");
    var int funcId; funcId = G1CP_Testsuite_CheckFunc("B_Kapitelwechsel", "void|int", "");
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel");
    const int CHAPTER_NUM = 2;

    // Start the second chapter
    G1CP_Testsuite_AssertLt(G1CP_GetIntVarI(chptrId, 0, 0), CHAPTER_NUM);
    MEM_PushIntParam(CHAPTER_NUM);
    MEM_CallById(funcId);

    // Teleport the player
    Wld_SetTime(10, 0);
    G1CP_Testsuite_NpcBeamTo(hero, wp.name);
};
