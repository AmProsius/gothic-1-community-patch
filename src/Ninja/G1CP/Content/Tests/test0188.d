/*
 * #188 Cor Kalom can be told that the weed was delivered multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_SUCCESS, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0188() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Kalom_KrautboteBACK_Condition");
    var int deliveredId; deliveredId = G1CP_Testsuite_CheckIntVar("Kalom_DeliveredWeed", 0);
    var int questId;
    if (G1CP_IsFixApplied(24)) {
        questId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote", 0);
    } else {
        questId = G1CP_Testsuite_CheckIntVar("Kalom_DrugMonopol", 0);
    };
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Back up the values
    var int deliveredWeedBak; deliveredWeedBak = G1CP_GetIntVarI(deliveredId, 0, 0);
    var int krautboteBak; krautboteBak = G1CP_GetIntVarI(questId, 0, 0);

    // Set the variables
    G1CP_SetIntVarI(deliveredId, 0, TRUE);
    G1CP_SetIntVarI(questId, 0, LOG_SUCCESS);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore the variables
    G1CP_SetIntVarI(deliveredId, 0, deliveredWeedBak);
    G1CP_SetIntVarI(questId, 0, krautboteBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
