/*
 * #@ISSUE_NUM@ @LONGNAME@
 */
func void G1CP_Test_@ISSUE_NUM_PAD@() {
    @LANGCHECK@
    const string ARRAY_NAME = "### TODO Name of the array ###"
    const string INDEX_NAME = "### TODO Name of the index ###";
    const string expected = "### TODO Expected string ###";

    var int index; index = G1CP_Testsuite_GetIntConst(INDEX_NAME);
    var string strName; strName = G1CP_ComposeArraySymbolName(ARRAY_NAME, index);
    var string actual; actual = G1CP_Testsuite_GetStringConst(strName);

    G1CP_Testsuite_AssertS(actual, expected);
};
