/*
 * #184 Bartholo can be given weed multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_RUNNING, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0184() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Bartholo_Krautbote_Condition");
    var int currierId; currierId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote");
    var int deliveredId; deliveredId = G1CP_Testsuite_CheckIntVar("Kalom_DeliveredWeed");
    const int LOG_RUNNING = 1;

    G1CP_Testsuite_BackupInt(currierId, 0);
    G1CP_Testsuite_BackupInt(deliveredId, 0);

    G1CP_SetIntVarI(currierId, 0, LOG_RUNNING);
    G1CP_SetIntVarI(deliveredId, 0, TRUE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
