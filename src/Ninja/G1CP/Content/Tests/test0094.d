/*
 * #94 Spelling - Horatio: "noch einmal" (DE)
 */
func void G1CP_Test_0094() {
    const string instr[2] = {
        "The hero is teleported to Horatio to check the wording of 'nochmal' in the dialog choice.",
        "Expected behavior: The dialog choice has the correct spelling of 'noch einmal'."
    };
    G1CP_Testsuite_CheckManual(instr);
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
