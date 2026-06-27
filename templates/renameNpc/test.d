/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func void G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("### TODO NPC instance ###");
    G1CP_Testsuite_AssertS(npc.name, "### TODO Correct name ###");
};
