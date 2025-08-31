/*
 * #182 The gate guard can be bribed multiple times with Dusty as a follower
 *
 * The bribe function is executed and the dialog condition is called.
 *
 * Expected behavior: The dialog condition function returns false.
 */
func void G1CP_Test_0182() {
    var string topic; topic = G1CP_Testsuite_GetStringConst("CH1_RecruitDusty");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogFunc("DIA_Grd_216_DustyZoll_LittleWalk");
    var int condId; condId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Grd_216_DustyZoll_Condition");
    var int oreId; oreId = G1CP_Testsuite_CheckItem("ItMiNugget");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Vlk_524_Dusty");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_PARTYMEMBER");
    const int LOG_MISSION = 0;

    G1CP_Testsuite_BackupInvAmount(hero, oreId);
    G1CP_Testsuite_BackupAiVar(npc, aiVarId);
    G1CP_Testsuite_BackupTopic(topic);
    G1CP_Testsuite_BackupNpcWp(npc);

    // Call the function that creates the log entry
    G1CP_Testsuite_NpcSetInvItemAmount(hero, oreId, 5000); // Should be enough
    Log_CreateTopic(topic, LOG_MISSION);
    G1CP_Testsuite_Call(funcId, 0, 0, TRUE);

    // Check the actual dialog condition
    G1CP_NpcSetAiVarI(npc, aiVarId, TRUE);
    G1CP_Testsuite_NpcBeamTo(npc, Npc_GetNearestWp(hero));
    G1CP_Testsuite_Call(condId, 0, 0, TRUE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
