/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    const string instr[2] = {
        "The hero ist teleported to ### TODO Specify location. Make sure first line is unique string ###",
        "Expected behavior: ### TODO Add actions to observe ###"
    };
    G1CP_Testsuite_CheckManual(instr);
    @LANGCHECK@;
    G1CP_Testsuite_CheckWorld(/*### TODO Replace 'G1CP_WLD_MAIN' with the appropriate level ###*/G1CP_WLD_MAIN);
    var C_Npc npc; npc = G1CP_Testsuite_FindNpc("### TODO NPC instance name ###");
    /*### TODO Add additional checks ###*/

    /*### TODO Set values ###*/

    /*### TODO Check teleport location. Alternatively use G1CP_Testsuite_FindWaypoint ###*/
    G1CP_Testsuite_NpcBeamTo(hero, _PM_InstName(npc));
};
