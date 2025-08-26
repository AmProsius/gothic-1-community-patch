/*
 * #205 Wolf not listed as merchant
 *
 * Check if the dialog creates the topic if it did not exist and if the log entry appears when applying the fix.
 *
 * Expected behavior: The log topic is correctly created in both cases.
 */
func int G1CP_Test_0205() {
    const string TEMP_TOPIC_NAME = "G1CP Test 205"; // Has to be a unique name with absolute certainty
    const string GE_TraderNC = ""; GE_TraderNC = G1CP_Testsuite_GetStringConst("GE_TraderNC");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Wolf_Hello");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Wolf_Hello_Info");

    // Check status of the test
    var int passed; passed = TRUE;

    // First test: Check if the dialog function creates the topic if it did not exist beforehand

    // Rename the log topic if it already exists
    G1CP_LogRenameTopic(GE_TraderNC, TEMP_TOPIC_NAME);

    // Just run the dialog and see what happens
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check if the log entry was created
    if (!G1CP_LogGetTopic(GE_TraderNC)) {
        G1CP_TestsuiteErrorDetail("Log topic was not created by the dialog function");
        passed = FALSE;
    };

    // Clean up
    G1CP_LogRemoveTopic(GE_TraderNC);

    // Second test: Check if the log entry is created on applying the fix
    // This second test is specific to how the G1CP fixes the bug and will fail if a mod fixed the issue in another way
    var int r;

    // Backup the told status of the dialog
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);

    // Revert the fix
    r = G1CP_0205_LogEntryWolfMerchantRevert();

    // Set the dialog to told
    G1CP_SetInfoToldI(infoId, TRUE);

    // Re-apply the fix
    if (G1CP_GetFixStatus(205) > G1CP_FIX_DISABLED) {
        r = G1CP_0205_LogEntryWolfMerchant();
    };

    // Check if the topic was created
    if (!G1CP_LogGetTopic(GE_TraderNC)) {
        G1CP_TestsuiteErrorDetail("Log topic was not auto-created on applying the fix");
        passed = FALSE;
    };

    // Revert everything
    r = G1CP_0205_LogEntryWolfMerchantRevert();
    G1CP_SetInfoToldI(infoId, toldBak);
    if (G1CP_GetFixStatus(205) > G1CP_FIX_DISABLED) {
        r = G1CP_0205_LogEntryWolfMerchant();
    };
    G1CP_LogRemoveTopic(GE_TraderNC);
    G1CP_LogRenameTopic(TEMP_TOPIC_NAME, GE_TraderNC);

    // Return success
    return passed;
};
