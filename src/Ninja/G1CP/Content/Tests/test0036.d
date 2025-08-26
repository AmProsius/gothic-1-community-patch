/*
 * #36 Fisk's quest isn't triggered
 *
 * The hero is given the correct guild and the condition function of the dialog is called.
 *
 * Expected behavior: The condition function will return TRUE.
 */
func int G1CP_Test_0036() {
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("Stt_311_Fisk_MordragKO_Condition");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Org_826_Mordrag");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("MordragKO_HauAb");

    // Define possibly missing symbols locally
    const int ATR_HITPOINTS = 0;
    const int ATR_HITPOINTS_MAX = 1;

    // Backup values
    var int varBak; varBak = G1CP_GetIntVarI(varId, 0, 0);
    var int guildBak; guildBak = Npc_GetTrueGuild(hero);
    var int hpBak; hpBak = npc.attribute[ATR_HITPOINTS];

    // Set new values
    Npc_SetTrueGuild(hero, GIL_NONE);

    // Now do two passes for each OR-condition
    var int pass1;
    var int pass2;

    // First pass: Mordrag is dead but the variable is false
    G1CP_SetIntVarI(varId, 0, FALSE);
    npc.attribute[ATR_HITPOINTS] = 0;

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    pass1 = MEM_PopIntResult();
    if (!pass1) {
        G1CP_TestsuiteErrorDetailSSS("Condition '", G1CP_GetSymbolName(npc), " is dead' failed");
    };

    // Second pass: The variable is true but Mordrag is alive
    G1CP_SetIntVarI(varId, 0, TRUE);
    npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];

    // Call dialog condition function
    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    pass2 = MEM_PopIntResult();
    if (!pass2) {
        G1CP_TestsuiteErrorDetailSSS("Condition '", G1CP_GetSymbolName(varId), " == FALSE' failed");
    };

    // Restore values
    G1CP_SetIntVarI(varId, 0, varBak);
    Npc_SetTrueGuild(hero, guildBak);
    npc.attribute[ATR_HITPOINTS] = hpBak;

    // Check return value
    return (pass1) && (pass2);
};
