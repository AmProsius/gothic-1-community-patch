/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    const string npcName = "### TODO: NPC name ###";
    const string correctedString = "### TODO: Corrected string ###";
    var C_Npc npc; npc = G1CP_Testsuite_CreateNpc(npcName);
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectNpcString(npc, "name", correctedString);
};
