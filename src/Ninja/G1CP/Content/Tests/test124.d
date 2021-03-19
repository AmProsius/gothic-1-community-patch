/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 *
 * The chapter four is started and the hero is teleported in front of castle gate.
 * Caution: The game will no longer be playable when running this test. Save the game beforehand.
 *
 * Expected behavior: The castle gate should be closed (or closing?).
 */
func void G1CP_Test_124() {
    if (G1CP_TestsuiteAllowManual) {
        // Define possibly missing symbols locally
        const int GIL_GRD = 2;

        var int passed; passed = TRUE;

        var int func1Id; func1Id = MEM_GetSymbolIndex("B_Kapitelwechsel");
        if (func1Id == -1) {
            G1CP_TestsuiteErrorDetail("Function 'B_Kapitelwechsel' not found");
            passed = FALSE;
        };

        var int func2Id; func2Id = MEM_GetSymbolIndex("B_Story_FMTaken");
        if (func2Id == -1) {
            G1CP_TestsuiteErrorDetail("Function 'B_Story_FMTaken' not found");
            passed = FALSE;
        };

        if (!passed) {
            return;
        };

        // Change the chapter
        MEM_PushIntParam(4);
        MEM_CallById(func1Id);
        MEM_CallById(func2Id);

        // Change the player's guild to not be attacked
        hero.guild = GIL_GRD;
        Npc_SetTrueGuild(hero, GIL_GRD);

        // Teleport the PC to the castle gate
        AI_Teleport(hero, "OCR_THORUS");
    };
};
