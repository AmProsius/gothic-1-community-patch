/*
 * #16 Thorus' bribe dialog doesn't disappear
 *
 * The AI variable Grd_212_Torwache.aivar[AIV_PASSGATE] is set to TRUE and the condition functions of both dialogs are
 * called for each of them.
 *
 * Expected behavior: The condition functions will return FALSE.
 */
func int G1CP_Test_0016() {
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Grd_212_Torwache");
    var int func1Id; func1Id = G1CP_Testsuite_CheckDialogConditionFunc("Info_Thorus_Give1000Ore_Condition");
    var int func2Id; func2Id = G1CP_Testsuite_CheckDialogConditionFunc("Info_Thorus_LetterForMages_Condition");
    var int info1Id; info1Id = G1CP_Testsuite_CheckInfo("Info_Thorus_BribeGuard");
    var int info2Id; info2Id = G1CP_Testsuite_CheckInfo("Info_Thorus_EnterCastle");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_PASSGATE");
    G1CP_Testsuite_CheckPassed();

    var int aiVarBak; aiVarBak = G1CP_NpcGetAiVarI(npc, aiVarId, 0);
    var int told1Bak; told1Bak = Npc_KnowsInfo(hero, info1Id);
    var int told2Bak; told2Bak = Npc_KnowsInfo(hero, info2Id);
    if (final()) {
        G1CP_NpcSetAiVarI(npc, aiVarId, aiVarBak);
        G1CP_SetInfoToldI(info1Id, told1Bak);
        G1CP_SetInfoToldI(info2Id, told2Bak);
    };

    // First dialog
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_SetInfoToldI(info1Id, TRUE);
    G1CP_Testsuite_Call(func1Id, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    // Second dialog
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_SetInfoToldI(info2Id, TRUE);
    G1CP_Testsuite_Call(func2Id, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    return TRUE;
};
