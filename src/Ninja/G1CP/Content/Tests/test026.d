/*
 * #26 Lares's guard doesn't attack the player
 *
 * The hero is given a new guild, attitude and guard status and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_026() {
    const int GIL_GRD = 0; GIL_GRD = G1CP_Testsuite_GetIntConst("GIL_GRD", 0);
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Info_Org_804_FirstWarn_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_804_Organisator");
    var int aiVarId; aiVarId = G1CP_Testsuite_CheckIntConst("AIV_GUARDPASSAGE_STATUS", 0);
    G1CP_Testsuite_CheckPassed();

    // Define possibly missing symbols locally
    const int ATT_NEUTRAL = 2;
    const int AIV_GPS_FIRSTWARN = 1;

    // Backup values
    var int guildBak; guildBak = hero.guild;
    var int attitBak; attitBak = Npc_GetAttitude(npc, hero);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAIVarI(hero, aiVarId, -1);
    var string wpBak; wpBak = npc.wp;
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    Npc_SetTempAttitude(npc, ATT_NEUTRAL);
    G1CP_NpcSetAIVarI(hero, aiVarId, AIV_GPS_FIRSTWARN);
    hero.guild = GIL_GRD;
    npc.wp = Npc_GetNearestWP(npc);
    self = MEM_CpyInst(npc);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    hero.guild = guildBak;
    Npc_SetTempAttitude(npc, attitBak);
    G1CP_NpcSetAIVarI(hero, aiVarId, aiVarBak);
    npc.wp = wpBak;

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
