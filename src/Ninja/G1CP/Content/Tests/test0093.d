/*
 * #93 Spelling - Horatio: "zuzuschlagen" (DE)
 *
 * The faulty log topic entry will be temporarily created and the fix is called, then the dialog function will be
 * called to check if the entry was correctly created there, too.
 *
 * Expected behavior: The wording of the log topic entry will be correct in both cases.
 */
func int G1CP_Test_0093() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    const string TEMP_TOPIC_NAME = "G1CP Test 93"; // Has to be a unique name with absolute certainty
    const string CH1_HoratiosTeachings = "";
    CH1_HoratiosTeachings = G1CP_Testsuite_GetStringConst("CH1_HoratiosTeachings");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Horatio_PleaseTeachSTR_Info");

    // Define variables for specific test
    // I'm sorry for not breaking the line at 120 characters
    const string logEntryWrong = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschalgen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";
    const string logEntryRight = "Horatio, ein Bauer auf den Reisfeldern des Neuen Lagers will mir beibringen, stärker zuzuschlagen. Doch irgendwie habe ich noch nicht die richtige Antwort auf seine Frage WOZU gefunden.";

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(CH1_HoratiosTeachings, TEMP_TOPIC_NAME);

    // Check status of the test
    var int passed; passed = TRUE;

    // First pass: Create the log topic with the faulty entry and see if the fix will update it

    // Create the topic
    Log_CreateTopic(CH1_HoratiosTeachings, LOG_MISSION);
    Log_SetTopicStatus(CH1_HoratiosTeachings, LOG_RUNNING);
    Log_AddEntry(CH1_HoratiosTeachings, logEntryWrong);

    // Trigger the fix (careful now, don't overwrite the fix status!)
    var int r; r = G1CP_0093_DE_LogEntryHoratio();

    // Check if it was updated
    if (G1CP_LogHasEntry(CH1_HoratiosTeachings, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(CH1_HoratiosTeachings, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(CH1_HoratiosTeachings);

    // Second pass: Call the dialog function and observe if it creates the corrected entry

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if it was updated
    if (G1CP_LogHasEntry(CH1_HoratiosTeachings, logEntryWrong)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(CH1_HoratiosTeachings, logEntryRight)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(CH1_HoratiosTeachings);

    // Restore the topic to how it was before
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, CH1_HoratiosTeachings);

    // Return success
    return passed;
};
