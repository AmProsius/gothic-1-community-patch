/*
 * #55 Reactivate In Extremo concert
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: InExtremo is playing and Grim (if available) will talk to the player about it.
 */
func void G1CP_Test_0055() {
    G1CP_Testsuite_CheckManual();
    const int CHAPTER_NUM = 2;
    var zCWaypoint wp; wp = G1CP_Testsuite_FindWaypoint("OCR_THORUS");
    var int funcId; funcId = G1CP_Testsuite_CheckFunc("B_Kapitelwechsel", "void|int", "");
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel");

    if (G1CP_GetIntVarI(chptrId, 0, 0) >= 2) {
        G1CP_TestsuiteErrorDetail("It must be chapter one to run this test");
        return;
    };

    // Start the second chapter
    MEM_PushIntParam(CHAPTER_NUM);
    MEM_CallById(funcId);

    // Teleport the player
    Wld_SetTime(10, 0);
    AI_Teleport(hero, wp.name);
};
