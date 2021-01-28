/*
 * #15 Horatio may lower STRENGTH
 *
 * The hero is first given strength < 100 and then strength > 100 before each calling the original dialog.
 *
 * Expected behavior: The hero never loses strength
 */
func int Ninja_G1CP_Test_015() {
    // Define possibly missing symbols locally
    const int ATR_STRENGTH = 4;

    // Check status of the test
    var int passed; passed = TRUE;

    // Find Horatio first
    var int symbId; symbId = MEM_FindParserSymbol("Bau_901_Horatio");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Bau_901_Horatio' not found");
        passed = FALSE;
    };

    // Check if Horatio exists in the world
    var C_Npc horatio; horatio = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(horatio)) {
        Ninja_G1CP_TestsuiteErrorDetail("'Bau_901_Horatio' is not a valid NPC");
        passed = FALSE;
    };

    // Check if the dialog function exists
    var int funcId; funcId = MEM_FindParserSymbol("DIA_Horatio_HelpSTR_LEARN_NOW");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup the original strength
    var int strengthBak; strengthBak = hero.attribute[ATR_STRENGTH];

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(horatio);
    other = MEM_CpyInst(hero);

    // First pass: strength < 100
    hero.attribute[ATR_STRENGTH] = 10;
    MEM_CallByID(funcId);
    if (hero.attribute[ATR_STRENGTH] <= 10) {
        Ninja_G1CP_TestsuiteErrorDetail("Strength was not increased when below 100");
        hero.attribute[ATR_STRENGTH] = strengthBak;
        passed = FALSE;
    };

    // Second pass: strength > 100
    hero.attribute[ATR_STRENGTH] = 1000;
    MEM_CallByID(funcId);
    if (hero.attribute[ATR_STRENGTH] != 1000) {
        Ninja_G1CP_TestsuiteErrorDetail("Strength was reset to 100");
        hero.attribute[ATR_STRENGTH] = strengthBak;
        passed = FALSE;
    };

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore original strength
    hero.attribute[ATR_STRENGTH] = strengthBak;

    // At last
    return passed;
};
