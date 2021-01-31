/*
 * #17 Jackal doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_017() {
    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Info_Jackal_Hello_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog 'Info_Jackal_Hello_Condition' not found");
        passed = FALSE;
    };

    // Find Jackal
    var int symbId; symbId = MEM_FindParserSymbol("GRD_201_Jackal");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'GRD_201_Jackal' not found");
        passed = FALSE;
    };

    // Check if Jackal exists in the world
    var C_Npc jackal; jackal = Hlp_GetNpc(symbId);
    if (!Hlp_IsValidNpc(jackal)) {
        Ninja_G1CP_TestsuiteErrorDetail("'GRD_201_Jackal' is not a valid NPC");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Backup the original guild
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);

    // Assign a random guild
    Npc_SetTrueGuild(hero, 4);

    // Backup self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set self and other
    self  = MEM_CpyInst(jackal);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Restore guild
    Npc_SetTrueGuild(hero, guildBak);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
