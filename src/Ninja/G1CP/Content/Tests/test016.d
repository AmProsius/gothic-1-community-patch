/*
 * #16 Thorus' bribe dialog doesn't disappear
 *
 * The AI variable Grd_212_Torwache.aivar[AIV_PASSGATE] is set to TRUE and the condition functions of both dialogs are
 * called for each of them.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int G1CP_Test_016_RunDialog(var string dialogName, var string needsInfo) {
    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId(dialogName);
    G1CP_Testsuite_CheckIntConst("AIV_PASSGATE", 0);
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("Grd_212_Torwache");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int aiVarBak; aiVarBak = G1CP_NpcGetAIVar(npc, "AIV_PASSGATE", 0);         // AI variable
    var int toldBak; toldBak = Npc_KnowsInfo(hero, MEM_GetSymbolIndex(needsInfo)); // Told status
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);                                  // self
    var C_Npc othBak; othBak = MEM_CpyInst(other);                                 // other

    // Set new values
    G1CP_NpcSetAIVar(npc, "AIV_PASSGATE", TRUE);                                   // AI variable
    G1CP_SetInfoTold(needsInfo, TRUE);                                             // Told status
    self  = MEM_CpyInst(hero);                                                     // self
    other = MEM_CpyInst(hero);                                                     // other

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);                                                   // self
    other = MEM_CpyInst(othBak);                                                   // other
    G1CP_NpcSetAIVar(npc, "AIV_PASSGATE", aiVarBak);                               // AI variable
    G1CP_SetInfoTold(needsInfo, toldBak);                                          // Told status

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetailSSS("Dialog condition '", dialogName, "' failed");
        return FALSE;
    };

    return TRUE;
};
func int G1CP_Test_016() {
    var int ret; ret = 0;

    // First dialog
    ret += G1CP_Test_016_RunDialog("Info_Thorus_Give1000Ore_Condition",    "Info_Thorus_BribeGuard");
    ret += G1CP_Test_016_RunDialog("Info_Thorus_LetterForMages_Condition", "Info_Thorus_EnterCastle");

    return (ret == 2);
};
