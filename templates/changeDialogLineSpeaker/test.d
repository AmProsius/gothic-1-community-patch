/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@;
    /*### TODO Additional check, backup and setter to ensure clean dialog execution ###*/
    G1CP_Tpl_TestOuSpeaker(
        "### TODO Info instance name ###",
        "### TODO Output unit / SVM instance name ###",
        /*### TODO Replace TRUE with FALSE if other is speaker ###*/TRUE
    );
};
