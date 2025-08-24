/*
 * #26 Lares's guard doesn't attack the player
 *
 * The hero is given a new guild, attitude and guard status and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_0026() {
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Org_804_FirstWarn_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_804_Organisator");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_GUARDPASSAGE_STATUS");
    G1CP_Testsuite_CheckPassed();

    const int ATT_NEUTRAL = 2;
    const int AIV_GPS_FIRSTWARN = 1;

    var int guildBak; guildBak = hero.guild;
    var int attitBak; attitBak = Npc_GetAttitude(npc, hero);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAiVarI(hero, aiVarId, -1);
    var string wpBak; wpBak = npc.wp;
    if (final()) {
        hero.guild = guildBak;
        Npc_SetTempAttitude(npc, attitBak);
        G1CP_NpcSetAiVarI(hero, aiVarId, aiVarBak);
        npc.wp = wpBak;
    };

    Npc_SetTempAttitude(npc, ATT_NEUTRAL);
    G1CP_NpcSetAiVarI(hero, aiVarId, AIV_GPS_FIRSTWARN);
    hero.guild = GIL_GRD;
    npc.wp = Npc_GetNearestWp(npc);

    G1CP_Testsuite_Call(funcId, npc, hero, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);

    return TRUE;
};
