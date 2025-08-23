/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    var C_Item itm; itm = G1CP_Testsuite_CreateItem("### TODO Item instance name ###");
    const int expected = 0; // ### TODO Expected value ###
    G1CP_Testsuite_CheckPassed();

    var int actual; actual = itm.property; // ### TODO Adjust "property" ###

    if (actual != expected) {
        G1CP_TestsuiteErrorDetailSIS("Property incorrect: ### TODO Class variable ### = '", actual, "'");
        return FALSE;
    };

    return TRUE;
};
