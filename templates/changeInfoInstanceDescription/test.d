/*
 * #{ISSUE_NUM} {LONGNAME}
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: ### TODO: Describe what will happen during the test ###
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    G1CP_Testsuite_CheckManual();
    {LANGCHECK}
    G1CP_Testsuite_CheckInfo("### TODO Info instance name ###");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("### TODO NPC instance name ###");
    // ### TODO Add checks to unlock the dialog ###

    // ### TODO Unlock the dialog ###

    AI_Teleport(hero, npc.wp);
};
