/*
 * #15 Horatio may lower STRENGTH
 *
 * The hero is first given strength < 100 and then strength > 100 before each calling the original dialog.
 *
 * Expected behavior: The hero never loses strength
 */
func int Ninja_G1CP_Test_015() {
    var int symbId; symbId = MEM_FindParserSymbol("DIA_Horatio_HelpSTR_LEARN_NOW");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
        return FALSE;
    };

    // Backup the original strength
    var int strengthBak; strengthBak = hero.attribute[/*ATR_STRENGTH*/4];

    // First pass: strength < 100
    hero.attribute[/*ATR_STRENGTH*/4] = 10;
    MEM_CallByID(symbId);
    if (hero.attribute[/*ATR_STRENGTH*/4] <= 10) {
        Ninja_G1CP_TestsuiteErrorDetail("Strength was not increased when below 100");
        hero.attribute[/*ATR_STRENGTH*/4] = strengthBak;
        return FALSE;
    };

    // Second pass: strength > 100
    hero.attribute[/*ATR_STRENGTH*/4] = 1000;
    MEM_CallByID(symbId);
    if (hero.attribute[/*ATR_STRENGTH*/4] != 1000) {
        Ninja_G1CP_TestsuiteErrorDetail("Strength was reset to 100");
        hero.attribute[/*ATR_STRENGTH*/4] = strengthBak;
        return FALSE;
    };

    hero.attribute[/*ATR_STRENGTH*/4] = strengthBak;
    return TRUE;
};
