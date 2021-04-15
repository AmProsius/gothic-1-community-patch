/*
 * #19 Scorpio's fight dialog doesn't disappear
 *
 * The hero is given a new guild and the Kapitel is adjusted and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_019() {
    // Define constants for specific test
    const string CHAPTER_NAME = "Kapitel";
    const string INFO_NAME    = "DIA_Scorpio_Hello";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId("DIA_Scorpio_REFUSETRAIN_Condition");
    G1CP_Testsuite_CheckIntVar(CHAPTER_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int   chapterBak; chapterBak = G1CP_GetIntVar(CHAPTER_NAME, 0, 0);
    var int   guildBak;   guildBak   = Npc_GetTrueGuild(hero);
    var int   toldBak;    toldBak    = Npc_KnowsInfo(hero, MEM_GetSymbolIndex(INFO_NAME));
    var C_Npc slfBak;     slfBak     = MEM_CpyInst(self);
    var C_Npc othBak;     othBak     = MEM_CpyInst(other);

    // Set new values
    G1CP_SetIntVar(CHAPTER_NAME, 0, 4);
    Npc_SetTrueGuild(hero, 0);
    G1CP_SetInfoTold(INFO_NAME, TRUE);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetIntVar(CHAPTER_NAME, 0, chapterBak);
    Npc_SetTrueGuild(hero, guildBak);
    G1CP_SetInfoTold(INFO_NAME, toldBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
