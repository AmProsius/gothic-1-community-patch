/*
 * #225 Mordrag can be told to "get out" in New Camp
 *
 * A variable and dialog are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func void G1CP_Test_0225() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Org_826_Mordrag_HauAb_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Org_826_Mordrag_GotoNewcamp");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Thorus_MordragKo");
    const int LOG_RUNNING = 1;

    G1CP_Testsuite_BackupTold(infoId);
    G1CP_Testsuite_BackupAiVar(npc, aiVarId);
    G1CP_Testsuite_BackupInt(varId, 0);

    G1CP_SetInfoToldI(infoId, TRUE);
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_SetIntVarI(varId, 0, LOG_RUNNING);

    G1CP_Testsuite_Call(funcId, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
