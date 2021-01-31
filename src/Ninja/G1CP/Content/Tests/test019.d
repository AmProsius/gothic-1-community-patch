/*
 * #19 Scorpio's fight dialog doesn't disappear
 *
 * The hero is given a new guild and the Kapitel is adjusted and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_019() {
    var int funcId;
    var int symbPtr;
    var int kapitelBak;
    var int guildBak;
    var int backupTold;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    funcId = MEM_FindParserSymbol("DIA_Scorpio_REFUSETRAIN_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'DIA_Scorpio_REFUSETRAIN_Condition' not found");
        passed = FALSE;
    };

    // Find Scorpio
    var int symbId; symbId = MEM_FindParserSymbol("Grd_205_Scorpio");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Grd_205_Scorpio' not found");
        passed = FALSE;
    };

    // Check if Scorpio exists in the world
    var C_Npc scorpio; scorpio = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(scorpio)) {
        Ninja_G1CP_TestsuiteErrorDetail("'Grd_205_Scorpio' is not a valid NPC");
        passed = FALSE;
    };

    // Check if variable exists
    symbPtr = MEM_GetSymbol("Kapitel");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Kapitel' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup the original Kapitel
    kapitelBak = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // Set to higher Kapitel
    MEM_WriteInt(symbPtr + zCParSymbol_content_offset, 4);

    // Backup the original guild
    guildBak = Npc_GetTrueGuild(hero);

    // Assign a random guild
    Npc_SetTrueGuild(hero, 0); // Not GRD

    // Backup told status of required dialog
    backupTold = Npc_KnowsInfo(hero, MEM_FindParserSymbol("DIA_Scorpio_Hello"));
    Ninja_G1CP_SetInfoTold("DIA_Scorpio_Hello", TRUE);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(scorpio);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Restore told status of required dialog
    Ninja_G1CP_SetInfoTold("DIA_Scorpio_Hello", backupTold);

    // Restore guild
    Npc_SetTrueGuild(hero, guildBak);

    // Restore kapitel
    MEM_WriteInt(symbPtr + zCParSymbol_content_offset, kapitelBak);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
