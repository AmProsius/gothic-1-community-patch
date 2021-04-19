/*
 * #184 Bartholo can be given weed multiple times
 *
 * The quest "Taking Weeds to Gomez" is set to LOG_RUNNING, the variable Kalom_DeliveredWeed is set to TRUE and the
 * condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_184() {
    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Check status of the test
    var int passed; passed = TRUE;

    // Find the dialog condition function
    var int funcId; funcId = G1CP_GetFuncID("Info_Bartholo_Krautbote_Condition", "int|none");
    if (funcId == -1) {
        G1CP_TestsuiteErrorDetail("Dialog condition 'Info_Bartholo_Krautbote_Condition' not found");
        passed = FALSE;
    };

    // Obtain symbols
    if (!G1CP_IsIntVar("Kalom_Krautbote", 0)) {
        G1CP_TestsuiteErrorDetail("Integer variable 'Kalom_Krautbote' not found");
        passed = FALSE;
    };
    if (!G1CP_IsIntVar("Kalom_DeliveredWeed", 0)) {
        G1CP_TestsuiteErrorDetail("Integer variable 'Kalom_DeliveredWeed' not found");
        passed = FALSE;
    };

    // At the latest now, we need to stop if there are fails already
    if (!passed) {
        return FALSE;
    };

    // Back up the values
    var int krautboteBak;     krautboteBak     = G1CP_GetIntVar("Kalom_Krautbote", 0, 0);
    var int deliveredWeedBak; deliveredWeedBak = G1CP_GetIntVar("Kalom_DeliveredWeed", 0, 0);

    // Set the variables
    G1CP_SetIntVar("Kalom_Krautbote",     0, LOG_RUNNING);
    G1CP_SetIntVar("Kalom_DeliveredWeed", 0, TRUE);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore the variables
    G1CP_SetIntVar("Kalom_Krautbote",     0, krautboteBak);
    G1CP_SetIntVar("Kalom_DeliveredWeed", 0, deliveredWeedBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
