/*
 * #24 Cor Kalom closes wrong quest
 *
 * The hero is given 500 ore nuggets and the dialog function is called.
 * Caution: This test will trigger the dialog as told and closes the quest. Save the game before this test.
 *
 * Expected behavior: The variable 'Kalom_DrugMonopol' remains as before and 'Kalom_Krautbote' is set to 'LOG_SUCCESS'
 */
func int G1CP_Test_024() {
    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Define variables for specific test
    var string drugMonopolName; drugMonopolName = "Kalom_DrugMonopol";
    var string krautboteName;   krautboteName   = "Kalom_Krautbote";

    // Prior checks
    var C_Npc npc;    npc    = G1CP_Testsuite_GetNpc("GUR_1201_CorKalom");
    var int   funcId; funcId = G1CP_Testsuite_GetDialogFuncId("Info_Kalom_KrautboteBACK_Info");
    var int   oreId;  oreId  = G1CP_Testsuite_GetItemId("ItMiNugget");
    G1CP_Testsuite_CheckIntVar(drugMonopolName);
    G1CP_Testsuite_CheckIntVar(krautboteName);
    G1CP_Testsuite_CheckPassed();

    // Check status of the test
    var int passed; passed = TRUE;

    // Backup values
    var int   drugMonopolBak; drugMonopolBak = G1CP_GetIntVar(drugMonopolName, 0, 0);
    var int   krautboteBak;   krautboteBak   = G1CP_GetIntVar(krautboteName, 0, 0);
    var C_Npc slfBak;         slfBak         = MEM_CpyInst(self);
    var C_Npc othBak;         othBak         = MEM_CpyInst(other);

    // Set new variables
    G1CP_SetIntVar(drugMonopolName, 0, LOG_RUNNING);
    G1CP_SetIntVar(krautboteName, 0, LOG_RUNNING);
    CreateInvItems(hero, oreId, 500); // Add 500 ore for the condition within the dialog
    self  = MEM_CpyInst(npc);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Check the variables now
    var int drugMonopolAfter; drugMonopolAfter = G1CP_GetIntVar(drugMonopolName, 0, 0);
    var int krautboteAfter;   krautboteAfter   = G1CP_GetIntVar(krautboteName, 0, 0);

    // Restore the variables
    G1CP_SetIntVar(drugMonopolName, 0, drugMonopolBak);
    G1CP_SetIntVar(krautboteName, 0, krautboteBak);

    // Confirm the fix
    if (drugMonopolAfter != LOG_RUNNING) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", drugMonopolName, "' was wrongfully closed");
        passed = FALSE;
    };
    if (krautboteAfter != LOG_SUCCESS) {
        G1CP_TestsuiteErrorDetailSSS("Mission '", krautboteName, "' is still open");
        passed = FALSE;
    };

    return passed;
};
