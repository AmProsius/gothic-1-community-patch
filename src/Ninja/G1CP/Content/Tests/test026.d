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
    var int funcId; funcId = MEM_FindParserSymbol("Info_Org_804_FirstWarn_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'Info_Org_804_FirstWarn_Condition' not found");
        passed = FALSE;
    };

    // Find the guard NPC
    var int guardId; guardId = MEM_FindParserSymbol("Org_804_Organisator");
    if (guardId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Org_804_Organisator' not found");
        passed = FALSE;
    };

    // Check if NPC exists
    var C_Npc guard; guard = Hlp_GetNpc(guardId);
    if (!Hlp_IsValidNpc(guard)) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Org_804_Organisator' not valid");
        passed = FALSE;
    };

    // Find the guild
    var int symbPtr; symbPtr = MEM_GetSymbol("GIL_GRD");
    if (!symbPtr) {
        Ninja_G1CP_TestsuiteErrorDetail("Variable 'GIL_GRD' not found");
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
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                           // Self
    other = MEM_CpyInst(othBak);                                                           // Other
    Ninja_G1CP_SetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", aiVarBak);                        // AI variable
    guard.wp = wpBak;                                                                      // Waypoint
    hero.guild = guildBak;                                                                 // Player guild
    Npc_SetTempAttitude(guard, attitBak);                                                  // Attitude

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
