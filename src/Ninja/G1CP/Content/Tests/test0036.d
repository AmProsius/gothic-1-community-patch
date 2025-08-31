/*
 * #36 Fisk's quest isn't triggered
 *
 * The hero is given the correct guild and the condition functions of the dialog are called.
 *
 * Expected behavior: The condition functions will return TRUE.
 */
func void G1CP_Test_0036() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Stt_311_Fisk_MordragKO_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("MordragKO_HauAb");
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");
    const int ATR_HITPOINTS = 0;
    const int ATR_HITPOINTS_MAX = 1;

    G1CP_Testsuite_BackupInt(varId, 0);
    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupIntAddr(_@(npc.attribute[ATR_HITPOINTS]));

    Npc_SetTrueGuild(hero, GIL_NONE);

    // Mordrag is dead but the variable is false
    G1CP_SetIntVarI(varId, 0, FALSE);
    npc.attribute[ATR_HITPOINTS] = 0;
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);

    // The variable is true but Mordrag is alive
    G1CP_SetIntVarI(varId, 0, TRUE);
    npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), TRUE);
};
