/*
 * #228 Gorn can't be asked about after talking to Lares
 *
 * Check if the dialog updated the AI variable.
 *
 * Expected behavior: The AI variable is updated correctly after talking to Lares.
 */
func void G1CP_Test_0228() {
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_JoinNC");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("PC_Fighter");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("ORG_801_Lares_BringListAnteil_Info");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_FINDABLE");

    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupAiVar(npc, aiVarId);

    G1CP_Testsuite_Call(funcId, npc, hero, TRUE);
    G1CP_Testsuite_Assert(G1CP_NpcGetAiVarI(npc, aiVarId, 0), TRUE);
};
