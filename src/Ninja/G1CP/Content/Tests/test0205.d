/*
 * #205 Wolf not listed as merchant
 *
 * Check if the dialog creates the topic if it did not exist and if the log entry appears when applying the fix.
 *
 * Expected behavior: The log topic is correctly created in both cases.
 */
func void G1CP_Test_0205() {
    var string topic; topic = G1CP_Testsuite_GetStringConst("GE_TraderNC");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Wolf_Hello");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Wolf_Hello_Info");

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupFixStatus();

    // Check if the dialog function creates the topic if it did not exist beforehand
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(topic), TRUE);
    G1CP_LogRemoveTopic(topic);

    // Check if the log entry is created on applying the fix
    // This second test is specific to how the G1CP fixes the bug and will fail if a mod fixed the issue in another way
    G1CP_SetInfoToldI(infoId, TRUE);
    G1CP_Testsuite_ReapplyFix();
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(topic), TRUE);
};
