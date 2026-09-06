/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@;
    const string symbolName = "### TODO Symbol name ###";
    const string dialogName = "### TODO Dialog name ###";
    const string originalString = "### TODO Original string ###";
    const string correctString = "### TODO Corrected string ###";
    const string tempTopicName = "G1CP Test @ISSUE_NUM@";
    var string symbId; symbId = G1CP_Testsuite_GetStringConst(symbolName);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc(dialogName);
    /*### TODO Additional checks ###*/

    const int LOG_MISSION = 0;
    const int LOG_RUNNING = 1;

    G1CP_LogRenameTopic(symbId, tempTopicName);

    var int passed; passed = TRUE;

    Log_CreateTopic(symbId, LOG_MISSION);
    Log_SetTopicStatus(symbId, LOG_RUNNING);
    Log_AddEntry(symbId, originalString);

    var int r; r = G1CP_@ISSUE_NUM_PAD@_@SHORTNAME@();

    if (G1CP_LogHasEntry(symbId, originalString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (incorrect) remained unchanged");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(symbId, correctString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry (correct) does not exist");
        passed = FALSE;
    };
    G1CP_LogRemoveTopic(symbId);

    /*### TODO Backup values ###*/
    /*### TODO Set new values ###*/

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    if (G1CP_LogHasEntry(symbId, originalString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was created with incorrect wording");
        passed = FALSE;
    };
    if (!G1CP_LogHasEntry(symbId, correctString)) {
        G1CP_TestsuiteErrorDetail("Log topic entry was not added by the dialog function");
        passed = FALSE;
    };

    /*### TODO Restore values ###*/

    G1CP_LogRemoveTopic(symbId);
    G1CP_LogRenameTopic(tempTopicName, symbId);

    return passed;
};
