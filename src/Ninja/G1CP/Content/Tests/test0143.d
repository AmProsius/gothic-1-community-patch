/*
 * #143 Spelling - Buster: "unterrichtet" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_0143() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string TEMP_TOPIC_NAME = "G1CP Test 143"; // Has to be a unique name with absolute certainty
    const string GE_TeacherNC = ""; GE_TeacherNC = G1CP_Testsuite_GetStringConst("GE_TeacherNC", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_ORG_833_Buster3_Info");
    G1CP_Testsuite_CheckPassed();

    // Define variables for specific test
    const string logEntryWrong = "Buster der Bandit unterichtet das Talent AKROBATIK.";
    const string logEntryRight = "Buster der Bandit unterrichtet das Talent AKROBATIK.";

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(GE_TeacherNC, TEMP_TOPIC_NAME);

    // Check status of the test
    var int passed; passed = TRUE;

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(GE_TeacherNC, LOG_MISSION);
    Log_SetTopicStatus(GE_TeacherNC, LOG_RUNNING);
    Log_AddEntry(GE_TeacherNC, logEntryWrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_0143_DE_LogEntryBuster();

    // Check if it was updated
    if (G1CP_LogHasEntry(GE_TeacherNC, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(GE_TeacherNC, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(GE_TeacherNC);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if it was updated
    if (G1CP_LogHasEntry(GE_TeacherNC, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(GE_TeacherNC, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(GE_TeacherNC);

    // Restore the topic to how it was before
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, GE_TeacherNC);

    // Return success
    return passed;
};
