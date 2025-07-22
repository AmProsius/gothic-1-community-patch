/*
 * #92 Spelling - Horatio: "den Reislord" (DE)
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 * Caution: This test will break the game. Be sure to save the game before.
 *
 * Expected behavior: The hero is merely teleported there, the dialog choice has the correct wording.
 */
func void G1CP_Test_0092() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckLang(G1CP_Lang_DE);
    G1CP_Testsuite_CheckInfo("DIA_Horatio_PleaseTeachSTR");
    var int helloId; helloId = G1CP_Testsuite_CheckInfo("DIA_Horatio_Hello");
    var int storyId; storyId = G1CP_Testsuite_CheckInfo("DIA_Horatio_Story");
    var int horatioId; horatioId = G1CP_Testsuite_CheckInfo("DIA_Jeremiah_Horatio");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Bau_901_Horatio");
    G1CP_Testsuite_CheckPassed();

    // Set unlock the dialog
    G1CP_SetInfoToldI(helloId, TRUE); // Optional
    G1CP_SetInfoToldI(storyId, TRUE);
    G1CP_SetInfoToldI(horatioId, TRUE);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
