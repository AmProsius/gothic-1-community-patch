/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func void G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");

    G1CP_Testsuite_AssertS(itm.name, "### TODO Expected string ###");
};
