/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace item name of "XXX_ITEM" ###
    // ### TODO: Replace corrected string of "Corrected" ###

    {LANGCHECK}
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("XXX_ITEM");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectItemString(itm, "description", "Corrected");
};
