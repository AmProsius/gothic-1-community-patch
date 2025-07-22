/*
 * #24 Cor Kalom closes wrong quest
 *
 * The hero is given 500 ore nuggets and the dialog function is called.
 * Caution: This test will trigger the dialog as told and closes the quest. Save the game before this test.
 *
 * Expected behavior: The variable 'Kalom_DrugMonopol' remains as before and 'Kalom_Krautbote' is set to 'LOG_SUCCESS'
 */
func int G1CP_Test_0024() {
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("GUR_1201_CorKalom");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Info_Kalom_KrautboteBACK_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var int drugId; drugId = G1CP_Testsuite_CheckIntVar("Kalom_DrugMonopol", 0);
    var int krautId; krautId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Check status of the test
    var int passed; passed = TRUE;

    // Backup values
    var int drugMonopolBak; drugMonopolBak = G1CP_GetIntVarI(drugId, 0, 0);
    var int krautboteBak; krautboteBak = G1CP_GetIntVarI(krautId, 0, 0);

    // Set new variables
    G1CP_SetIntVarI(drugId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(krautId, 0, LOG_RUNNING);
    CreateInvItems(hero, itemId, 500); // Add 500 ore for the condition within the dialog

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);

    // Check the variables now
    var int drugMonopolAfter; drugMonopolAfter = G1CP_GetIntVarI(drugId, 0, 0);
    var int krautboteAfter; krautboteAfter = G1CP_GetIntVarI(krautId, 0, 0);

    // Restore the variables
    G1CP_SetIntVarI(drugId, 0, drugMonopolBak);
    G1CP_SetIntVarI(krautId, 0, krautboteBak);

    // Confirm the fix
    if (drugMonopolAfter != LOG_RUNNING) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", G1CP_GetSymbolName(drugId), "' was wrongfully closed");
        passed = FALSE;
    };
    if (krautboteAfter != LOG_SUCCESS) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", G1CP_GetSymbolName(krautId), "' is still open");
        passed = FALSE;
    };

    return passed;
};
