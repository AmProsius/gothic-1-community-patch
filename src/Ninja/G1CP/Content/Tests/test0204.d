/*
 * #204 Cavalorn not listed as tutor
 *
 * Check if the dialog creates the topic if it did not exist.
 *
 * Expected behavior: The log topic is correctly created.
 */
func void G1CP_Test_0204() {
    var string topic; topic = G1CP_Testsuite_GetStringConst("GE_TeacherOW");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Fingers_WhereCavalorn_Info");

    G1CP_Testsuite_BackupTopic(topic);

    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(topic), TRUE);
};
