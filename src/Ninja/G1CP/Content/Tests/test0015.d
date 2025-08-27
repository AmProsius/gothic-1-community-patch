/*
 * #15 Horatio may lower Strength
 *
 * The hero is first given strength < 100 and then strength > 100 before each calling the original dialog.
 *
 * Expected behavior: The hero never loses strength
 */
func void G1CP_Test_0015() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Horatio_HelpSTR_LEARN_NOW");
    const int ATR_STRENGTH = 4;

    G1CP_Testsuite_BackupIntAddr(_@(hero.attribute[ATR_STRENGTH]));

    // Strength should increase when strength < 100
    hero.attribute[ATR_STRENGTH] = 10;
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertGt(hero.attribute[ATR_STRENGTH], 10);

    // Strength should not decrease when strength > 100
    hero.attribute[ATR_STRENGTH] = 1000;
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertGe(hero.attribute[ATR_STRENGTH], 1000);
};
