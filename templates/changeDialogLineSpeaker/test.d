/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: ### TODO: Describe what will happen during the test ###
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace NPC name of "Xxx_Npc" ###
    G1CP_Testsuite_CheckManual();
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("Xxx_Npc");
    // ### TODO: Optional: Add checks to unlock the dialog ###
    G1CP_Testsuite_CheckPassed();

    // ### TODO: Optional: Unlock the dialog ###

    AI_Teleport(hero, npc.wp);
};
