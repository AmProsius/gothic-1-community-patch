/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string npcInst = "### TODO NPC instance ###";
    const string correctedName = "### TODO Correct name ###";

    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc(npcInst);
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectNpcString(npc, "name", correctedName);
};
