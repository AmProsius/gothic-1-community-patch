/*
 * #18 Bloodwyn doesn't recognize the player's camp membership
 *
 * The hero is given a new guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_018() {
    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogFuncId("Info_Bloodwyn_Hello_Condition");

    // Backup values
    var int   guildBak; guildBak = Npc_GetTrueGuild(hero);   // Guild
    var C_Npc slfBak;   slfBak   = MEM_CpyInst(self);        // self
    var C_Npc othBak;   othBak   = MEM_CpyInst(other);       // other

    // Set new values
    Npc_SetTrueGuild(hero, 4);                               // Guild (random)
    self  = MEM_CpyInst(hero);                               // self
    other = MEM_CpyInst(hero);                               // other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                             // self
    other = MEM_CpyInst(othBak);                             // other
    Npc_SetTrueGuild(hero, guildBak);                        // Guild

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
