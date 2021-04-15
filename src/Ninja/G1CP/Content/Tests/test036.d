/*
 * #36 Fisk's quest isn't triggered
 *
 * The hero is given the correct guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int G1CP_Test_036() {
    // Define possibly missing symbols locally
    const int GIL_NONE = 0;
    const int ATR_HITPOINTS = 0;
    const int ATR_HITPOINTS_MAX = 1;

    // Define constants for specific test
    const string HAU_AB_NAME = "MordragKO_HauAb";
    const string STAY_AT_NC_NAME = "MordragKO_StayAtNC";

    // Prior checks
    var int funcId; funcId = G1CP_Testsuite_GetDialogConditionFuncId("Stt_311_Fisk_MordragKO_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_GetNpc("Org_826_Mordrag");
    G1CP_Testsuite_CheckIntVar(HAU_AB_NAME, 0);
    G1CP_Testsuite_CheckIntVar(STAY_AT_NC_NAME, 0);
    G1CP_Testsuite_CheckPassed();

    // Backup values
    var int hauAbBak; hauAbBak = G1CP_GetIntVar(HAU_AB_NAME, 0, 0);
    var int stayAtNCBak; stayAtNCBak = G1CP_GetIntVar(STAY_AT_NC_NAME, 0, 0);
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);
    var int hpBak; hpBak = npc.attribute[ATR_HITPOINTS];
    var C_Npc slfBak; slfBak = MEM_CpyInst(self);
    var C_Npc othBak; othBak = MEM_CpyInst(other);

    // Set new values
    G1CP_SetIntVar(HAU_AB_NAME, 0, FALSE);
    Npc_SetTrueGuild(hero, GIL_NONE);
    self = MEM_CpyInst(hero);
    other = MEM_CpyInst(hero);

    // Now do two passes for each OR-condition
    var int pass1; 
    var int pass2;

    // First pass: Mordrag is dead but MordragKO_StayAtNC is false
    G1CP_SetIntVar(STAY_AT_NC_NAME, 0, FALSE);
    npc.attribute[ATR_HITPOINTS] = 0;

    // Call dialog condition function
    MEM_CallByID(funcId);
    pass1 = MEM_PopIntResult();
    if (!pass1) {
        G1CP_TestsuiteErrorDetail("Condition 'Mordrag is dead' failed");
    };

    // Second pass: MordragKO_StayAtNC is true but Mordrag is alive
    G1CP_SetIntVar(STAY_AT_NC_NAME, 0, TRUE);
    npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];

    // Call dialog condition function
    MEM_CallByID(funcId);
    pass2 = MEM_PopIntResult();
    if (pass2) {
        G1CP_TestsuiteErrorDetailSSS("Condition '", STAY_AT_NC_NAME, "' did not fail");
    };

    // Restore values
    self = MEM_CpyInst(slfBak);
    other = MEM_CpyInst(othBak);
    G1CP_SetIntVar(HAU_AB_NAME, 0, hauAbBak);
    G1CP_SetIntVar(STAY_AT_NC_NAME, 0, stayAtNCBak);
    Npc_SetTrueGuild(hero, guildBak);
    npc.attribute[ATR_HITPOINTS] = hpBak;

    // Check return value
    return (pass1) && (!pass2);
};
