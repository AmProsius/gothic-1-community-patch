/*
 * #26 Lares's guard doesn't attack the player
 *
 * The hero is given a new guild, attitude and guard status and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_026() {
    // Define possibly missing symbols locally
    const int ATT_NEUTRAL       = 2;
    const int AIV_GPS_FIRSTWARN = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if the dialog exists
    var int symbId; symbId = MEM_FindParserSymbol("Info_Org_804_FirstWarn_Condition");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(26, "Original dialog not found");
        passed = FALSE;
    };

    // Find the guard NPC
    var int guardId; guardId = MEM_FindParserSymbol("Org_804_Organisator");
    if (guardId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(26, "Npc 'Org_804_Organisator' not found");
        passed = FALSE;
    };

    // Check if NPC exists
    var C_Npc guard; guard = Hlp_GetNpc(guardId);
    if (!Hlp_IsValidNpc(guard)) {
        Ninja_G1CP_TestsuiteErrorDetail(26, "Npc 'Org_804_Organisator' is not a valid NPC");
        passed = FALSE;
    };

    // Find the guild
    var int symbPtr; symbPtr = MEM_GetSymbol("GIL_GRD");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail(26, "Variable 'GIL_GRD' not found");
        passed = FALSE;
    };

    // Obtain guild value
    var int GIL_GRD; GIL_GRD = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup values
    var int attitBak; attitBak = Npc_GetAttitude(guard, hero);                             // Attitude
    var int guildBak; guildBak = hero.guild;                                               // Player guild
    var string wpBak; wpBak = guard.wp;                                                    // Waypoint
    var int aiVarBak; aiVarBak = Ninja_G1CP_GetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", -1); // AI variable
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                          // Self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                         // Other

    // Set new values
    Npc_SetTempAttitude(guard, ATT_NEUTRAL);                                               // Attitude
    hero.guild = GIL_GRD;                                                                  // Player guild
    guard.wp = Npc_GetNearestWP(guard);                                                    // Waypoint
    Ninja_G1CP_SetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", AIV_GPS_FIRSTWARN);               // AI variable
    self  = MEM_CpyInst(guard);                                                            // Self
    other = MEM_CpyInst(hero);                                                             // Other

    // Call dialog condition function
    MEM_CallByID(symbId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                           // Attitude
    other = MEM_CpyInst(othBak);                                                           // Player guild
    Ninja_G1CP_SetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", aiVarBak);                        // Waypoint
    guard.wp = wpBak;                                                                      // AI variable
    hero.guild = guildBak;                                                                 // Self
    Npc_SetTempAttitude(guard, attitBak);                                                  // Other

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail(26, "Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
