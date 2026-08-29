/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    const string instr[2] = {
        "### TODO Provide instructions for manual test. Make sure first line is unique string ###",
        "Expected behavior: ### TODO Add actions to observe ###"
    };
    G1CP_Testsuite_CheckManual(instr);
    @LANGCHECK@;
    G1CP_Testsuite_CheckWorld(/*### TODO Replace 'G1CP_WLD_MAIN' with the appropriate level ###*/G1CP_WLD_MAIN);
    /*### TODO Write checks ###*/

    /*### TODO Write the test ###*/
};
