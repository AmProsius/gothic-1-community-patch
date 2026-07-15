/*
 * #91 Spelling - Horatio: "Ricelord" (DE)
 */
func void G1CP_Test_0091() {
    const string instr[2] = {
        "The hero is teleported to Horatio to check the spelling of 'Reislord' in the dialog choice.",
        "Expected behavior: The dialog choice has the correct spelling of 'dem Reislord'."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckInfo("DIA_Horatio_ThoughtSTR");
    var int helloId; helloId = G1CP_Testsuite_CheckInfo("DIA_Horatio_Hello");
    var int teachStrId; teachStrId = G1CP_Testsuite_CheckInfo("DIA_Horatio_PleaseTeachSTR");
    var int horatioId; horatioId = G1CP_Testsuite_CheckInfo("DIA_Jeremiah_Horatio");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("horatio_StrFree");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Bau_901_Horatio");

    // Set unlock the dialog
    G1CP_SetInfoToldI(helloId, TRUE); // Optional
    G1CP_SetInfoToldI(teachStrId, TRUE);
    G1CP_SetInfoToldI(horatioId, TRUE);
    G1CP_SetIntVarI(varId, 0, FALSE);
    AI_Teleport(hero, npc.wp);
};
