/*
 * #188 Cor Kalom can be told that the weed was delivered multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_SUCCESS, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0188() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Kalom_KrautboteBACK_Condition");
    var int deliveredId; deliveredId = G1CP_Testsuite_CheckIntVar("Kalom_DeliveredWeed");
    const int LOG_SUCCESS = 2;
    var int questId;
    if (G1CP_IsFixApplied(24)) {
        questId = G1CP_Testsuite_CheckIntVar("Kalom_Krautbote");
    } else {
        questId = G1CP_Testsuite_CheckIntVar("Kalom_DrugMonopol");
    };

    G1CP_Testsuite_BackupInt(deliveredId, 0);
    G1CP_Testsuite_BackupInt(questId, 0);

    G1CP_SetIntVarI(deliveredId, 0, TRUE);
    G1CP_SetIntVarI(questId, 0, LOG_SUCCESS);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
