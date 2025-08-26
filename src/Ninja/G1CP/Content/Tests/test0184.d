/*
 * #184 Bartholo can be given weed multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_RUNNING, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0184() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Bartholo_Krautbote_Condition");
    var int currierId; currierId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote");
    var int deliveredId; deliveredId = G1CP_Testsuite_CheckIntVar("Kalom_DeliveredWeed");

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Back up the values
    var int krautboteBak; krautboteBak = G1CP_GetIntVarI(currierId, 0, 0);
    var int deliveredWeedBak; deliveredWeedBak = G1CP_GetIntVarI(deliveredId, 0, 0);

    // Set the variables
    G1CP_SetIntVarI(currierId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(deliveredId, 0, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore the variables
    G1CP_SetIntVarI(currierId, 0, krautboteBak);
    G1CP_SetIntVarI(deliveredId, 0, deliveredWeedBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
