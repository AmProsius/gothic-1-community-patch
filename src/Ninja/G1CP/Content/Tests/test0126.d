/*
 * #126 The trading menu is opened after Sharky is appointed as new fence
 *
 * The "trade" property of the info is checked.
 *
 * Expected behavior: Sharky's dialog about Fisk's quest will not open the trade menu.
 */
func int G1CP_Test_0126() {
    var oCInfo info; info = G1CP_Testsuite_FindInfo("Org_843_Sharky_Fisk");
    G1CP_Testsuite_CheckPassed();

    if (info.trade) {
        G1CP_TestsuiteErrorDetail("Dialog is a trade dialog");
        return FALSE;
    } else {
        return TRUE;
    };
};
