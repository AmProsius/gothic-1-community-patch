/*
 * #203 Graham not listed as merchant
 *
 * Check if the dialog creates the topic if it did not exist and if the log entry appears when applying the fix.
 *
 * Expected behavior: The log topic is correctly created in both cases.
 */
func int G1CP_Test_203() {
    const string TEMP_TOPIC_NAME = "G1CP Test 203"; // Has to be a unique name with absolute certainty
    var int topicId; topicId = G1CP_Testsuite_CheckStringConst("GE_TraderOC", 0);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Graham_Hello");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Graham_Hello_Info");
    G1CP_Testsuite_CheckPassed();

    // Get constant values
    const string TOPIC = ""; TOPIC = G1CP_GetStringConstI(topicId, 0, TOPIC);

    // Check status of the test
    var int passed; passed = TRUE;

    // First test: Check if the dialog function creates the topic if it did not exist beforehand

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(TOPIC, TEMP_TOPIC_NAME);

    // Backup and set self and other
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);
    self  = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Just run the dialog and see what happens
    MEM_CallByID(funcId);

    // Stop the output units
    Npc_ClearAIQueue(hero);
    AI_StandUpQuick(hero);

    // Restore self and other
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);

    // Check if the log entry was created
    if (!G1CP_LogGetTopic(TOPIC)) {
        G1CP_TestsuiteErrorDetail("Log topic was not created by the dialog function");
        passed = FALSE;
    };

    // Clean up
    G1CP_LogRemoveTopic(TOPIC);

    // Second test: Check if the log entry is created on applying the fix
    // This second test is specific to how the G1CP fixes the bug and will fail if a mod fixed the issue in another way
    var int r;

    // Backup the told status of the dialog
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Revert the fix
    r = G1CP_203_LogEntryGrahamMerchantRevert();

    // Set the dialog to told
    G1CP_SetInfoToldI(infoId, TRUE);

    // Re-apply the fix
    r = G1CP_203_LogEntryGrahamMerchant();

    // Check if the topic was created
    if (!G1CP_LogGetTopic(TOPIC)) {
        G1CP_TestsuiteErrorDetail("Log topic was not auto-created on applying the fix");
        passed = FALSE;
    };

    // Revert everything
    r = G1CP_203_LogEntryGrahamMerchantRevert();
    G1CP_SetInfoToldI(infoId, toldBak);
    r = G1CP_203_LogEntryGrahamMerchant();
    G1CP_LogRemoveTopic(TOPIC);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, TOPIC);

    // Return success
    return passed;
};
