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
    const string infoName = "### TODO: Info name ###";
    const string npcName = "### TODO: NPC name ###";
    G1CP_Testsuite_CheckInfo(infoName);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc(npcName);
    // ### TODO: Add checks to unlock the dialog ###
    G1CP_Testsuite_CheckPassed();

    // ### TODO: Unlock the dialog ###

    AI_Teleport(hero, npc.wp);
};
