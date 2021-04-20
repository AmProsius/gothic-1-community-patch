/*
 * #55 Reactivate In Extremo concert
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Save the game beforehand.
 *
 * Expected behavior: InExtremo is playing and Grim (if available) will talk to the player about it.
 */
func void G1CP_Test_055() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check for symbols
    var int passed; passed = TRUE;
    var int funcId; funcId = G1CP_GetFuncID("B_Kapitelwechsel", "void|int");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Function 'B_Kapitelwechsel' not found");
        passed = FALSE;
    };
    if (!G1CP_IsIntVar("Kapitel", 0)) {
        G1CP_TestsuiteErrorDetail("Integer variable 'Kapitel' not found");
        passed = FALSE;
    } else if (G1CP_GetIntVar("Kapitel", 0, 0) >= 2) {
        G1CP_TestsuiteErrorDetail("It must be chapter one to run this test");
        passed = FALSE;
    };

    // Leave here at the latest
    if (!passed) {
        return;
    };

    // Start the second chapter
    MEM_PushIntParam(2);
    MEM_CallByID(funcId);

    // Teleport the player
    Wld_SetTime(10, 0);
    AI_Teleport(hero, "OCR_THORUS");
};
