/*
 * #278 Ambient women dialog subtitles don't match the audio (EN)
 */
func int G1CP_Test_278() {
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("SVM_16_NotNow");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectOuString(ouPtr, "text", "Shh, you're not allowed to talk to us.");
};



//
// Alternatively this. The idea is that it requires a manual inspection to compare subtitle text and spoken audio.
//

/*
 * #278 Ambient women dialog subtitles don't match the audio (EN)
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The hero is merely teleported to Chani in order to compare subtitles and spoken audio.
 */
/*
func void G1CP_Test_278() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckLang(G1CP_Lang_EN);
    var int chptrId; chptrId = G1CP_Testsuite_CheckIntVar("Kapitel", 0);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Gur_1205_Chani");
    G1CP_Testsuite_CheckPassed();

    // Set new values
    G1CP_SetIntVarI(chptrId, 0, 2);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
*/
