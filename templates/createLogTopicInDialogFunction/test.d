/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    /* ### TODO: Replace topic name of "XX_TopicName" ### */
    /* ### TODO: Replace info name of "DIA_Info_Name" ### */
    /* ### TODO: Replace info function name of "DIA_Function_Name_Info" ### */

    const string TEMP_TOPIC_NAME = "G1CP Test {ISSUE_NUM}"; // Has to be a unique name with absolute certainty
    const string topicName = ""; topicName = G1CP_Testsuite_GetStringConst("XX_TopicName", 0);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Info_Name");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Function_Name_Info");

    // Check status of the test
    var int passed; passed = TRUE;

    // First test: Check if the dialog function creates the topic if it did not exist beforehand

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(topicName, TEMP_TOPIC_NAME);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if the log entry was created
    if (!G1CP_LogGetTopic(topicName)) {
        G1CP_TestsuiteErrorDetail("Log topic was not created by the dialog function");
        passed = FALSE;
    };

    // Clean up
    G1CP_LogRemoveTopic(topicName);

    // Second test: Check if the log entry is created on applying the fix
    // This second test is specific to how the G1CP fixes the bug and will fail if a mod fixed the issue in another way
    var int r;

    // Backup the told status of the dialog
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Revert the fix
    r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert();

    // Set the dialog to told
    G1CP_SetInfoToldI(infoId, TRUE);

    // Re-apply the fix
    r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}();

    // Check if the topic was created
    if (!G1CP_LogGetTopic(topicName)) {
        G1CP_TestsuiteErrorDetail("Log topic was not auto-created on applying the fix");
        passed = FALSE;
    };

    // Revert everything
    r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}Revert();
    G1CP_SetInfoToldI(infoId, toldBak);
    r = G1CP_{ISSUE_NUM_PAD}_{SHORTNAME}();
    G1CP_LogRemoveTopic(topicName);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, topicName);

    // Return success
    return passed;
};
