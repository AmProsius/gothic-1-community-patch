/*
 * #26 Lares's guard doesn't attack the player
 */
func void G1CP_Test_0026() {
    G1CP_Testsuite_CheckWorld(G1CP_WLD_MAIN);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Org_804_FirstWarn_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_804_Organisator");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_GUARDPASSAGE_STATUS");
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    const int AIV_GPS_FIRSTWARN = 1;

    G1CP_Testsuite_BackupIntAddr(_@(hero.guild));
    G1CP_Testsuite_BackupAttitude(npc, hero);
    G1CP_Testsuite_BackupAiVar(hero, aiVarId);
    G1CP_Testsuite_BackupStrAddr(_@s(npc.wp));

    Npc_SetTempAttitude(npc, ATT_NEUTRAL);
    G1CP_NpcSetAiVarI(hero, aiVarId, AIV_GPS_FIRSTWARN);
    hero.guild = GIL_GRD;
    npc.wp = Npc_GetNearestWp(npc);

    G1CP_Testsuite_Call(funcId, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
