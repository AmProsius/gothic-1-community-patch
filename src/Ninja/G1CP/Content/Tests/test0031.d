/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 *
 * A required dialog is set to 'told' and the condition functions of both dialogs are called.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int G1CP_Test_0031_RunDialog(var int itemId, var int num, var string dialogName) {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc(dialogName);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Info_Wolf_MCPLATESENOUGH");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Set new values
    G1CP_SetInfoToldI(infoId, TRUE);
    CreateInvItems(hero, itemId, num);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(infoId, toldBak);
    Npc_RemoveInvItems(hero, itemId, Npc_HasItems(hero, itemId));

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetailSSS("Dialog condition '", dialogName, "' failed");
        return FALSE;
    };

    return TRUE;
};
func int G1CP_Test_0031() {
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Knows_GetMCPlates");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItAt_Crawler_02");
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int varBak; varBak = G1CP_GetIntVarI(varId, 0, 0);
    var int itmNumBak; itmNumBak = Npc_HasItems(hero, itemId);

    // Set new values
    G1CP_SetIntVarI(varId, 0, TRUE);
    if (itmNumBak > 0) {
        Npc_RemoveInvItems(hero, itemId, itmNumBak);
    };

    // Run dialogs
    var int passed; passed = FALSE;
    passed += G1CP_Test_0031_RunDialog(itemId, 1,  "Info_Wolf_MCPLATESFEW_Condition");
    passed += G1CP_Test_0031_RunDialog(itemId, 15, "Info_Wolf_MCPLATESENOUGH_Condition");

    // Restore values
    G1CP_SetIntVarI(varId, 0, varBak);
    if (itmNumBak > 0) {
        CreateInvItems(hero, itemId, itmNumBak);
    };

    return (passed == 2);
};
