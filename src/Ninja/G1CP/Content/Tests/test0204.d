/*
 * #204 Cavalorn not listed as tutor
 *
 * Check if the dialog creates the topic if it did not exist.
 *
 * Expected behavior: The log topic is correctly created.
 */
func int G1CP_Test_0204() {
    const string TEMP_TOPIC_NAME = "G1CP Test 204"; // Has to be a unique name with absolute certainty
    const string GE_TeacherOW = ""; GE_TeacherOW = G1CP_Testsuite_GetStringConst("GE_TeacherOW", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Fingers_WhereCavalorn_Info");
    G1CP_Testsuite_CheckPassed();

    // Check status of the test
    var int passed; passed = TRUE;

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(GE_TeacherOW, TEMP_TOPIC_NAME);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if the log entry was created
    if (!G1CP_LogGetTopic(GE_TeacherOW)) {
        G1CP_TestsuiteErrorDetail("Log topic was not created by the dialog function");
        passed = FALSE;
    };

    // Revert everything
    G1CP_LogRemoveTopic(GE_TeacherOW);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, GE_TeacherOW);

    // Return success
    return passed;
};
