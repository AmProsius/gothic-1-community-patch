/*
 * #33 Shrike's Hut quest
 *
 * A variable and dialog are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_033() {
    // Define constants for specific test
    const string INFO_NAME = "DIA_Gorn_Hut";
    const string AI_VAR_NAME = "AIV_WASDEFEATEDBYSC";
    const string VAR_NAME = "Gorn_ShrikesHut";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId("DIA_Shrike_GetLost_Condition");
    var int infoId; infoId = G1CP_Testsuite_GetInfoId(INFO_NAME);
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("ORG_842_Shrike");
    G1CP_Testsuite_CheckIntVar(AI_VAR_NAME, 0);
    G1CP_Testsuite_CheckIntVar(VAR_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int toldBak; toldBak = Npc_KnowsInfo(hero, infoId);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAIVar(npc, AI_VAR_NAME, FALSE);
    var int varBak; varBak = G1CP_GetIntVar(VAR_NAME, 0, 0);
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetInfoTold(INFO_NAME, FALSE);
    G1CP_NpcSetAIVar(npc, AI_VAR_NAME, TRUE);
    G1CP_SetIntVar(VAR_NAME, 0, 0);
    self  = MEM_CpyInst(npc);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self  = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetInfoTold(INFO_NAME, toldBak);
    G1CP_NpcSetAIVar(npc, AI_VAR_NAME, aiVarBak);
    G1CP_SetIntVar(VAR_NAME, 0, varBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
