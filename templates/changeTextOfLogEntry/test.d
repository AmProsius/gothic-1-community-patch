/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string symbolName = "### TODO: Symbol name ###";
    const string dialogName = "### TODO: Dialog name ###";
    const string originalString = "### TODO: Original string ###";
    const string correctedString = "### TODO: Corrected string ###";
    const string tempTopicName = "G1CP Test {ISSUE_NUM}";
    const string symbId = ""; symbId = G1CP_Testsuite_GetStringConst(symbolName, 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc(dialogName);
    /* ### TODO: Optional: Additional checks ### */

    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    G1CP_LogRenameTopic(symbId, tempTopicName);

    var int passed; passed = TRUE;

    Log_CreateTopic(symbId, LOG_MISSION);
    Log_SetTopicStatus(symbId, LOG_RUNNING);
    Log_AddEntry(symbId, originalString);

    var int r; r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}();

    if (G1CP_LogHasEntry(symbId, originalString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(symbId, correctedString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(symbId);

    /* ### TODO: Optional: Backup values ### */
    /* ### TODO: Optional: Set new values ### */

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    if (G1CP_LogHasEntry(symbId, originalString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(symbId, correctedString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };

    /* ### TODO: Optional: Restore values ### */

    G1CP_LogRemoveTopic(symbId);
    G1CP_LogRenameTopic(tempTopicName, symbId);

    return passed;
};
