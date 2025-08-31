/*
 * #33 Shrike's Hut quest
 *
 * A variable and dialog are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0033() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Shrike_GetLost_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Gorn_Hut");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("ORG_842_Shrike");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Gorn_ShrikesHut");
    const int LOG_SUCCESS = 2;

    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupAiVar(npc, aiVarId);
    G1CP_Testsuite_BackupInt(varId, 0);

    G1CP_SetInfoToldI(infoId, FALSE);
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_SetIntVarI(varId, 0, LOG_SUCCESS);

    G1CP_Testsuite_Call(funcId, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
