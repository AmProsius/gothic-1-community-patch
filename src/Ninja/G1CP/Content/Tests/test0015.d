/*
 * #15 Horatio may lower Strength
 *
 * The hero is first given strength < 100 and then strength > 100 before each calling the original dialog.
 *
 * Expected behavior: The hero never loses strength
 */
func int G1CP_Test_0015() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Horatio_HelpSTR_LEARN_NOW");
    G1CP_Testsuite_CheckPassed();

    const int ATR_STRENGTH = 4;

    var int strengthBak; strengthBak = hero.attribute[ATR_STRENGTH];
    if (final()) {
        hero.attribute[ATR_STRENGTH] = strengthBak;
    };

    // Strength should increase when strength < 100
    hero.attribute[ATR_STRENGTH] = 10;
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertGt(hero.attribute[ATR_STRENGTH], 10);

    // Strength should not decrease when strength > 100
    hero.attribute[ATR_STRENGTH] = 1000;
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertGe(hero.attribute[ATR_STRENGTH], 1000);

    return TRUE;
};
