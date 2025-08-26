/*
 * #28 Mordrag doesn't refuse to escort the player
 *
 * A variable is temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0028() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Org_826_Mordrag_GotoNewcamp_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("Org_826_Mordrag_JoinNewcamp");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("MordragKO_HauAb");

    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int varBak; varBak = G1CP_GetIntVarI(varId, 0, 0);
    if (final()) {
        G1CP_SetInfoToldI(infoId, toldBak);
        G1CP_SetIntVarI(varId, 0, varBak);
    };

    G1CP_SetInfoToldI(infoId, TRUE);
    G1CP_SetIntVarI(varId, 0, TRUE);
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    return TRUE;
};
