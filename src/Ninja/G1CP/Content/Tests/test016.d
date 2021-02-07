/*
 * #16 Thorus' bribe dialog doesn't disappear
 *
 * The AI variable Grd_212_Torwache.aivar[AIV_PASSGATE] is set to TRUE and the condition functions of both dialogs are
 * called for each of them.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int Ninja_G1CP_Test_016_RunDialog(var string dialogName, var string needsInfo) {
    var int funcId;
    var int backupValue;
    var int backupTold;

    // Check status of the test
    var int passed; passed = TRUE;

    // Check if dialog exists
    funcId = MEM_FindParserSymbol(dialogName);
    if (funcId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog condition '", dialogName), "' not found"));
        passed = FALSE;
    };

    // Check if NPC and AI-variable exist
    backupValue = Ninja_G1CP_IdGetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", -42);
    if (backupValue == -42) {
        Ninja_G1CP_TestsuiteErrorDetail("NPC 'Grd_212_Torwache' or variable 'AIV_PASSGATE' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Set the variable to TRUE
    Ninja_G1CP_IdSetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", TRUE);

    // Backup told status of required dialog
    backupTold = Npc_KnowsInfo(hero, MEM_FindParserSymbol(needsInfo));
    Ninja_G1CP_SetInfoTold(needsInfo, TRUE);

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

    // Restore told status of required dialog
    Ninja_G1CP_SetInfoTold(needsInfo, backupTold);

    // Restore value
    Ninja_G1CP_IdSetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", backupValue);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings("Dialog condition '", dialogName), "' failed"));
        return FALSE;
    };

    return TRUE;
};
func int Ninja_G1CP_Test_016() {
    var int ret; ret = 0;

    // First dialog
    ret += Ninja_G1CP_Test_016_RunDialog("Info_Thorus_Give1000Ore_Condition",    "Info_Thorus_BribeGuard");
    ret += Ninja_G1CP_Test_016_RunDialog("Info_Thorus_LetterForMages_Condition", "Info_Thorus_EnterCastle");

    return (ret == 2);
};
