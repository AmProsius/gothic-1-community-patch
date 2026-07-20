/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func int G1CP_Test_@ISSUE_NUM_PAD@() {
    const string instr[2] = {
        "The hero ist teleported to ### TODO Specify location. Make sure first line is unique string ###",
        "Expected behavior: ### TODO Add actions to observe ###"
    };
    G1CP_Testsuite_CheckManual(instr);
    G1CP_Testsuite_CheckWorld("### TODO Affected world, default is 'WORLD' ###");
    G1CP_Testsuite_CheckInfo("### TODO Info instance name ###");
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("### TODO NPC instance name ###");
    /*### TODO Add checks to unlock the dialog ###*/

    /*### TODO Unlock the dialog ###*/

    G1CP_Testsuite_NpcBeamTo(hero, npc.wp);
};
