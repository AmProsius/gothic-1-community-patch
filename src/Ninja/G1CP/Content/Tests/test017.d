/*
 * #17 Jackal doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_017() {
    var int symbId; symbId = MEM_FindParserSymbol("Info_Jackal_Hello_Condition");
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(17, "Original dialog not found");
        return FALSE;
    };

    // Backup the original guild
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);

    // Assign a random guild
    Npc_SetTrueGuild(hero, 4);

    // Call dialog condition function
    MEM_CallByID(symbId);
    var int ret; ret = MEM_PopIntResult();

    // Restore guild
    Npc_SetTrueGuild(hero, guildBak);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail(17, "Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
