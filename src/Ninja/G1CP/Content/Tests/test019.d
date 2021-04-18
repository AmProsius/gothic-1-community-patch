/*
 * #19 Scorpio's fight dialog doesn't disappear
 *
 * The hero is given a new guild and the Kapitel is adjusted and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_019() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Scorpio_REFUSETRAIN_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Scorpio_Hello");
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int GIL_NONE = 0;

    // Backup values
    var int chapterBak; chapterBak = G1CP_GetIntVarI(chptrId, 0, 0);
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetIntVarI(chptrId, 0, 4);
    Npc_SetTrueGuild(hero, GIL_NONE);
    G1CP_SetInfoToldI(infoId, TRUE);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetIntVarI(chptrId, 0, chapterBak);
    Npc_SetTrueGuild(hero, guildBak);
    G1CP_SetInfoToldI(infoId, toldBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
