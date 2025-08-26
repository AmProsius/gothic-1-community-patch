/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc("### TODO NPC instance ###");

    return G1CP_Testsuite_InspectNpcString(npc, "name", "### TODO Correct name ###");
};
