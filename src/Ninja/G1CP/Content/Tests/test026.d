/*
 * #26 Lares's guard doesn't attack the player
 *
 * The hero is given a new guild, attitude and guard status and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return FALSE.
 */
func int G1CP_Test_026() {
    // Define possibly missing symbols locally
    const int ATT_NEUTRAL = 2;
    const int AIV_GPS_FIRSTWARN = 1;

    // Define constants for specific test
    const string GUILD_NAME = "GIL_GRD";
    const string AI_VAR_NAME = "AIV_GUARDPASSAGE_STATUS";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId("Info_Org_804_FirstWarn_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("Org_804_Organisator");
    G1CP_Testsuite_CheckIntConst(GUILD_NAME, 0);
    G1CP_Testsuite_CheckIntConst(AI_VAR_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int attitBak; attitBak = Npc_GetAttitude(npc, hero);
    var int aiVarBak; aiVarBak = G1CP_NpcGetAIVar(hero, AI_VAR_NAME, -1);
    var int guildBak; guildBak = hero.guild;
    var string wpBak; wpBak = npc.wp;
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    Npc_SetTempAttitude(npc, ATT_NEUTRAL);
    G1CP_NpcSetAIVar(hero, AI_VAR_NAME, AIV_GPS_FIRSTWARN);
    hero.guild = G1CP_GetIntConst(GUILD_NAME, 0, 0);
    npc.wp = Npc_GetNearestWP(npc);
    self = MEM_CpyInst(npc);
    other = MEM_CpyInst(hero);

    // Call dialog condition function
    MEM_CallByID(funcId);
    var int ret; ret = MEM_PopIntResult();

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    Npc_SetTempAttitude(npc, attitBak);
    G1CP_NpcSetAIVar(hero, AI_VAR_NAME, aiVarBak);
    hero.guild = guildBak;
    npc.wp = wpBak;

    // Check return value
    if (ret) {
        G1CP_TestsuiteErrorDetail("Dialog condition failed");
        return FALSE;
    } else {
        return TRUE;
    };
};
