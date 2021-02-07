/*
 * #17 Jackal doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int Ninja_G1CP_Test_017() {
    // Check if dialog exists
    var int funcId; funcId = MEM_FindParserSymbol("Info_Jackal_Hello_Condition");
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail("Dialog condition 'Info_Jackal_Hello_Condition' not found");
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
    self  = MEM_CpyInst(hero);
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
