/*
 * #16 Thorus' bribe dialog doesn't disappear
 *
 * The AI variable Grd_212_Torwache.aivar[AIV_PASSGATE] is set to TRUE and the condition functions of both dialogs are
 * called for each of them.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int Ninja_G1CP_Test_016_RunDialog(var string dialogName, var string needsInfo) {
    var int symbId;
    var int backupValue;
    var int backupTold;

    // Check if dialog exists
    symbId = MEM_FindParserSymbol(dialogName);
    if (symbId == -1) {
        Ninja_G1CP_TestsuiteErrorDetail(16, ConcatStrings("Original dialog not found: ", dialogName));
        return FALSE;
    };

    // Check if NPC and AI-variable exist
    backupValue = Ninja_G1CP_GetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", -42);
    if (backupValue == -42) {
        Ninja_G1CP_TestsuiteErrorDetail(16, "'Grd_212_Torwache' or 'AIV_PASSGATE' does not exist");
        return FALSE;
    };

    // Set the variable to TRUE
    Ninja_G1CP_SetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", TRUE);

    // Backup told status of required dialog
    backupTold = Npc_KnowsInfo(hero, MEM_FindParserSymbol(needsInfo));
    Ninja_G1CP_SetInfoTold(needsInfo, TRUE);

    // Call dialog condition function
    MEM_CallByID(symbId);
    var int ret; ret = MEM_PopIntResult();

    // Restore told status of required dialog
    Ninja_G1CP_SetInfoTold(needsInfo, backupTold);

    // Restore value
    Ninja_G1CP_SetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", backupValue);

    // Check return value
    if (ret) {
        Ninja_G1CP_TestsuiteErrorDetail(16, ConcatStrings("Dialog condition failed: ", dialogName));
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
