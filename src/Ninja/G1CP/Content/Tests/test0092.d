/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 */
func void G1CP_Test_0092() {
    const string instr[2] = {
        "The hero is teleported to Horatio to check the missing article in the dialog choice.",
        "Expected behavior: The dialog choice has the correct spelling of 'den Reislord'."
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckInfo("DIA_Horatio_PleaseTeachSTR");
    var int helloId; helloId = G1CP_Testsuite_CheckInfo("DIA_Horatio_Hello");
    var int storyId; storyId = G1CP_Testsuite_CheckInfo("DIA_Horatio_Story");
    var int horatioId; horatioId = G1CP_Testsuite_CheckInfo("DIA_Jeremiah_Horatio");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Bau_901_Horatio");

    // Set unlock the dialog
    G1CP_SetInfoToldI(helloId, TRUE); // Optional
    G1CP_SetInfoToldI(storyId, TRUE);
    G1CP_SetInfoToldI(horatioId, TRUE);
    AI_Teleport(hero, npc.wp);
};
