/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * The dialog function is twice. Once called without the hero having a beer and once with.
 *
 * Expected behavior: The variable "drax_Lehrer_frei" is set/not set and log entry is created/not created accordingly.
 */
func void G1CP_Test_0027() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("Org_819_Drax_Scavenger_Info");
    var int itemId; itemId = G1CP_Testsuite_CheckItem("ItFoBeer");
    var int var1Id; var1Id = G1CP_Testsuite_CheckIntVar("drax_bierbekommen");
    var int var2Id; var2Id = G1CP_Testsuite_CheckIntVar("drax_Lehrer_frei");
    var string topic; topic = G1CP_Testsuite_GetStringConst("GE_TeacherOW");

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupInvAmount(hero, itemId);
    G1CP_Testsuite_BackupInt(var1Id, 0);
    G1CP_Testsuite_BackupInt(var2Id, 0);

    // No beer, variable should remain false and log entry not created
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 0);
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(G1CP_LogHasTopic(topic), 0);
    G1CP_Testsuite_Assert(G1CP_GetIntVarI(var2Id, 0, 0), FALSE);
    G1CP_LogRemoveTopic(topic);

    // Has beer, variable should be set to true and log entry should be created
    G1CP_Testsuite_NpcSetInvItemAmount(hero, itemId, 1);
    G1CP_SetIntVarI(var1Id, 0, FALSE);
    G1CP_SetIntVarI(var2Id, 0, FALSE);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);
    G1CP_Testsuite_AssertNe(G1CP_LogHasTopic(topic), 0);
    G1CP_Testsuite_AssertNe(G1CP_GetIntVarI(var2Id, 0, 0), FALSE);
};
