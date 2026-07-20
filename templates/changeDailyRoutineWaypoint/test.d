/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@;
    G1CP_Testsuite_CheckWorld(/*### TODO Replace 'G1CP_WLD_MAIN' with the appropriate level ###*/G1CP_WLD_MAIN);
    /*### TODO Additional check, backup and setter to ensure correct routine execution ###*/
    G1CP_Tpl_TestNpcRtnWP(
        "### TODO Corrected waypoint name ###",
        "### TODO NPC name ###",
        "### TODO Raw routine name without prefix ###",
        /*### TODO Replace '2330' with a day-time slightly after start of routine ###*/2330
    );
};
