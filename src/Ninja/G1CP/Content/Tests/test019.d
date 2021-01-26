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

    // Check if dialog exists
    funcId = MEM_FindParserSymbol("DIA_Scorpio_REFUSETRAIN_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Original dialog not found");
        return FALSE;
    };

    // Check if variable exists
    symbPtr = MEM_GetSymbol("Kapitel");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'Kapitel' not found");
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

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

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
