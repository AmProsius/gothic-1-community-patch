/*
 * #93 Spelling - Horatio: "zuzuschlagen" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func void G1CP_Test_0093() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Horatio_PleaseTeachSTR_Info");
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_HoratiosTeachings");
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;
    const string logEntryWrong = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string logEntryRight = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschlagen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupFixStatus();

    // Call the dialog function and observe if it creates the corrected entry
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryWrong), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryRight), TRUE);
    G1CP_LogRemoveTopic(topic);

    // Create the log topic with the faulty entry and see if the fix will update it
    Log_CreateTopic(topic, LOG_MISSION);
    Log_SetTopicStatus(topic, LOG_RUNNING);
    Log_AddEntry(topic, logEntryWrong);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryWrong), FALSE);
    G1CP_Testsuite_Assert(G1CP_LogHasEntry(topic, logEntryRight), TRUE);
};
