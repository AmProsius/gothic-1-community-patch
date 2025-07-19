/*
 * #30 Silas trades only one time
 *
 * The "permanent" property of the info is checked.
 *
 * Expected behavior: The dialog is permanent.
 */
func int G1CP_Test_0030() {
    var oCInfo info; info = G1CP_Testsuite_FindInfo("DIA_Silas_Trade");
    G1CP_Testsuite_CheckPassed();

    if (!info.permanent) {
        G1CP_TestsuiteErrorDetail("Dialog is not permanent");
        return FALSE;
    } else {
        return TRUE;
    };
};
