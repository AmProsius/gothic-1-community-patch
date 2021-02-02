/*
 * #36 Fisk's quest isn't triggered
 *
 * The hero is given the correct guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int Ninja_G1CP_Test_036() {
    // Define possibly missing symbols locally
    const int GIL_NONE          = 0;
    const int ATR_HITPOINTS     = 0;
    const int ATR_HITPOINTS_MAX = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Stt_311_Fisk_MordragKO_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'Stt_311_Fisk_MordragKO_Condition' not found");
        passed = FALSE;
    };

    // Find Fisk
    var int symbId; symbId = MEM_FindParserSymbol("Stt_311_Fisk");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'Stt_311_Fisk' not found");
        passed = FALSE;
    };

    // Check if Fisk exists in the world
    var C_Npc fisk; fisk = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(fisk)) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'Stt_311_Fisk' is not a valid NPC");
        passed = FALSE;
    };

    // Find Mordrag
    symbId = MEM_FindParserSymbol("Org_826_Mordrag");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'Org_826_Mordrag' not found");
        passed = FALSE;
    };

    // Check if Mordrag exists in the world
    var C_Npc mordrag; mordrag = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(mordrag)) {
        Ninja_G1CP_TestsuiteErrorDetail("Npc 'Org_826_Mordrag' is not a valid NPC");
        passed = FALSE;
    };

    // Check if variable exists
    var int hauAbPtr; hauAbPtr = MEM_GetSymbol("MordragKO_HauAb");
    if (!hauAbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'MordragKO_HauAb' not found");
        passed = FALSE;
    };
    hauAbPtr += zCParSymbol_content_offset;

    // Check if variable exists
    var int stayAtNcPtr; stayAtNcPtr = MEM_GetSymbol("MordragKO_StayAtNC");
    if (!stayAtNcPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Symbol 'MordragKO_StayAtNC' not found");
        passed = FALSE;
    };
    stayAtNcPtr += zCParSymbol_content_offset;

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int hauAbBak; hauAbBak = MEM_ReadInt(hauAbPtr);          // Variable
    var int stayAtNCBak; stayAtNCBak = MEM_ReadInt(stayAtNcPtr); // Variable
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);         // Guild
    var int hpBak; hpBak = mordrag.attribute[ATR_HITPOINTS];     // Mordrag's HP
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);               // Other

    // Set new values
    MEM_WriteInt(hauAbPtr, FALSE);                               // Variable
    Npc_SetTrueGuild(hero, GIL_NONE);                            // Guild
    self  = MEM_CpyInst(fisk);                                   // Self
    other = MEM_CpyInst(hero);                                   // Other

    // Now do two passes for each OR-condition
    var int ret; ret = 0;

    // First pass: Mordrag is dead but MordragKO_StayAtNC if false
    mordrag.attribute[ATR_HITPOINTS] = 0;
    MEM_WriteInt(stayAtNcPtr, FALSE);

    // Call dialog condition function
    MEM_CallByID(funcId);
    ret += MEM_PopIntResult();
    if (!ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Condition 'Mordrag is dead' failed");
    };

    // Second pass: MordragKO_StayAtNC is true but Mordrag is alive
    mordrag.attribute[ATR_HITPOINTS] = mordrag.attribute[ATR_HITPOINTS_MAX];
    MEM_WriteInt(stayAtNcPtr, TRUE);

    // Call dialog condition function
    MEM_CallByID(funcId);
    ret += MEM_PopIntResult();
    if (!ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Condition 'stay at NC' failed");
    };

    // Restore values
    self  = MEM_CpyInst(slfBak);                                 // Self
    other = MEM_CpyInst(othBak);                                 // Other
    mordrag.attribute[ATR_HITPOINTS] = hpBak;                    // Mordrag's HP
    Npc_SetTrueGuild(hero, guildBak);                            // Guild
    MEM_WriteInt(stayAtNcPtr, stayAtNCBak);                      // Variable
    MEM_WriteInt(hauAbPtr, hauAbBak);                            // Variable

    // Check return value
    return (ret == 2);
};