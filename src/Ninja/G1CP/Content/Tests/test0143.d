/*
 * #143 Spelling - Buster: "unterrichtet" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func void G1CP_Test_0143() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_ORG_833_Buster3_Info");
    var string topic; topic = G1CP_Testsuite_GetStringConst("GE_TeacherNC");
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const string logEntryIncorrect = "Buster der Bandit unterichtet das Talent AKROBATIK.";
    const string logEntryCorrect = "Buster der Bandit unterrichtet das Talent AKROBATIK.";

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupFixStatus();

    // Call the dialog function and observe if it creates the corrected entry
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
    G1CP_LogRemoveTopic(topic);

    // Create the log topic with the faulty entry and see if the fix will update it
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, logEntryIncorrect);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryIncorrect), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryCorrect), TRUE);
};
