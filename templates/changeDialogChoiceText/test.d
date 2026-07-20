/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@;
    G1CP_Testsuite_CheckWorld(/*### TODO Replace 'G1CP_WLD_MAIN' with the appropriate level ###*/G1CP_WLD_MAIN);
    /*### TODO Additional check, backup and setter to ensure clean dialog execution ###*/
    G1CP_Tpl_TestInfoChoiceText(
        "### TODO Info instance name ###",
        "### TODO NPC instance name ###",
        "### TODO Correct choice text ###"
    );
};
