/*
 * #19 Scorpio's fight dialog doesn't disappear
 */
func void G1CP_Test_0019() {
    var int funcId; funcId = G1CP_Testsuite_CheckDialogConditionFunc("DIA_Scorpio_REFUSETRAIN_Condition");
    var int infoId; infoId = G1CP_Testsuite_CheckInfo("DIA_Scorpio_Hello");
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel");
    const int GIL_NONE = 0; GIL_NONE = G1CP_Testsuite_GetIntConst("GIL_NONE");

    G1CP_Testsuite_BackupInt(chptrId, 0);
    G1CP_Testsuite_BackupTrueGuild(hero);
    G1CP_Testsuite_BackupTold(infoId);

    G1CP_SetIntVarI(chptrId, 0, 4);
    Npc_SetTrueGuild(hero, GIL_NONE);
    G1CP_SetInfoToldI(infoId, TRUE);

    G1CP_Testsuite_Call(funcId, 0, 0, FALSE);
    G1CP_Testsuite_Assert(MEM_PopIntResult(), FALSE);
};
