/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    {LANGCHECK}
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "### TODO Class variable, e.g. text[0] ###", "### TODO Expected string ###");
};
