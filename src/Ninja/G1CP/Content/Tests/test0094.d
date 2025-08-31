/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Be sure to save the game before.
 *
 * Expected behavior: The hero is merely teleported there, the dialog choice has the correct wording.
 */
func void G1CP_Test_0094() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckInfo("DIA_Horatio_ThoughtSTR");
    var int funcId; funcId = G1CP_Testsuite_CheckInfo("DIA_Horatio_PleaseTeachSTR");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("horatio_StrFree");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Bau_901_Horatio");

    // Set unlock the dialog
    G1CP_SetInfoToldI(funcId, TRUE);
    G1CP_SetIntVarI(varId, 0, FALSE);
    AI_Teleport(hero, npc.wp);
};
