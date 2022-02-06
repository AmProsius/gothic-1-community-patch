/*
 * #39 Fingers teaches advanced skills too soon
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The hero is merely teleported to Fletcher, the available dialog choices should match the skills.
 */
func void G1CP_Test_039() {
    G1CP_Testsuite_CheckManual();
    G1CP_Testsuite_CheckDialogFunc("DIA_Fingers_Lehrer_Info");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("STT_331_Fingers");
    var int varId; varId = G1CP_Testsuite_CheckIntVar("Fingers_CanTeach", 0);
    G1CP_Testsuite_CheckPassed();

    // Set unlock the dialog
    G1CP_SetIntVarI(varId, 0, TRUE);

    // Teleport the hero
    AI_Teleport(hero, npc.wp);
};
