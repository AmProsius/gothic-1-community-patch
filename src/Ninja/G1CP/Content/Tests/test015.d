/*
 * #15 Horatio may lower Strength
 *
 * The hero is first given strength < 100 and then strength > 100 before each calling the original dialog.
 *
 * Expected behavior: The hero never loses strength
 */
func int G1CP_Test_015() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Horatio_HelpSTR_LEARN_NOW");
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Check status of the test
    var int passed; passed = TRUE;

    // Backup values
    var int strengthBak; strengthBak = hero.attribute[ATR_STRENGTH];
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // First pass: strength < 100
    hero.attribute[ATR_STRENGTH] = 10;
    MEM_CallByID(funcId);
    if (hero.attribute[ATR_STRENGTH] <= 10) {
        G1CP_TestsuiteErrorDetail("Strength was not increased when below 100");
        passed = FALSE;
    };

    // Second pass: strength > 100
    hero.attribute[ATR_STRENGTH] = 1000;
    MEM_CallByID(funcId);
    if (hero.attribute[ATR_STRENGTH] < 1000) {
        G1CP_TestsuiteErrorDetail("Strength was decreased when above 100");
        passed = FALSE;
    };

    // Restore self and other
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore original strength
    hero.attribute[ATR_STRENGTH] = strengthBak;

    // At last
    return passed;
};
