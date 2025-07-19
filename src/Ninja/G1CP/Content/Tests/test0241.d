/*
 * #241 The player can become a guard after passing the fire mage trial
 *
 * A few values are temporarily set and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0241() {
    const int GIL_STT = 0; GIL_STT = G1CP_Testsuite_GetIntConst("GIL_STT", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("GRD_200_Thorus_GARDIST_Condition");
    var int logId; logId = G1CP_Testsuite_CheckIntVar("CorKalom_BringMCQBalls", 0);
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("GRD_200_Thorus_WANNABEMAGE");
    var int kdfId; kdfId = G1CP_Testsuite_CheckIntVar("Corristo_KDFAufnahme", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Backup values
    var int logBak; logBak = G1CP_GetIntVarI(logId, 0, 0);
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);
    var int infoBak; infoBak = Npc_KnowsInfo(hero, infoId);
    var int kdfBak; kdfBak = G1CP_GetIntVarI(kdfId, 0, 0);

    // Set new values
    G1CP_SetIntVarI(logId, 0, LOG_SUCCESS);
    Npc_SetTrueGuild(hero, GIL_STT);
    G1CP_SetInfoToldI(infoId, FALSE);
    G1CP_SetIntVarI(kdfId, 0, 4);

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    G1CP_SetIntVarI(logId, 0, logBak);
    Npc_SetTrueGuild(hero, guildBak);
    G1CP_SetInfoToldI(infoId, infoBak);
    G1CP_SetIntVarI(kdfId, 0, kdfBak);

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
