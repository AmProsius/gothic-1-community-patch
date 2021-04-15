/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 *
 * A required dialog is set to 'told' and the condition functions of both dialogs are called.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int G1CP_Test_031_RunDialog(var int itemId, var int num, var string dialogName) {
    // Define constants for specific test
    const string INFO_NAME = "Info_Wolf_MCPLATESENOUGH";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId(dialogName);
    var int infoId; infoId = G1CP_Testsuite_GetInfoId(INFO_NAME);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetInfoTold(INFO_NAME, TRUE);
    CreateInvItems(hero, itemId, num);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetInfoTold(INFO_NAME, toldBak);
    Npc_RemoveInvItems(hero, itemId, Npc_HasItems(hero, itemId));

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetailSSS("Dialog condition '", dialogName, "' failed");
        return FALSE;
    };

    return TRUE;
};
func int G1CP_Test_031() {
    // Define constants for specific test
    const string VAR_NAME = "Knows_GetMCPlates";

    // Prior checks
    G1CP_Testsuite_CheckIntVar(VAR_NAME);
    var int itemId; itemId = G1CP_Testsuite_GetItemId("ItAt_Crawler_02");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int varBak; varBak = G1CP_GetIntVar(VAR_NAME, 0, 0);
    var int itmNumBak; itmNumBak = Npc_HasItems(hero, itemId);

    // Set new values
    G1CP_SetIntVar(VAR_NAME, 0, TRUE);
    if (itmNumBak > 0) {
        Npc_RemoveInvItems(hero, itemId, itmNumBak);
    };

    // Run dialogs
    var int ret; ret = 0;
    ret += G1CP_Test_031_RunDialog(itemId, 1,  "Info_Wolf_MCPLATESFEW_Condition");
    ret += G1CP_Test_031_RunDialog(itemId, 15, "Info_Wolf_MCPLATESENOUGH_Condition");

    // Restore values
    G1CP_SetIntVar(VAR_NAME, 0, varBak);
    if (itmNumBak > 0) {
        CreateInvItems(hero, itemId, itmNumBak);
    };

    return (ret == 2);
};
