/*
 * #33 Shrike's Hut quest
 *
 * A variable and dialog are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_033() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Shrike_GetLost_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Gorn_Hut");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("ORG_842_Shrike");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_WASDEFEATEDBYSC", 0);
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Gorn_ShrikesHut", 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAIVarI(npc, aiVarId, FALSE);
    var int varBak; varBak = G1CP_GetIntVarI(varId, 0, 0);

    // Set new values
    G1CP_SetInfoToldI(infoId, FALSE);
    G1CP_NpcSetAIVarI(npc, aiVarId, TRUE);
    G1CP_SetIntVarI(varId, 0, 0);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, npc, hero, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetInfoToldI(infoId, toldBak);
    G1CP_NpcSetAIVarI(npc, aiVarId, aiVarBak);
    G1CP_SetIntVarI(varId, 0, varBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
