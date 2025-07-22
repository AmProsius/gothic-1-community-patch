/*
 * #{ISSUE_NUM} {LONGNAME}
 */
func int G1CP_Test_{ISSUE_NUM_PAD}() {
    // ### TODO: Replace OU name of "XXX_Ou" ###
    // ### TODO: Replace corrected string of "Corrected" ###
    {LANGCHECK}
    var int ouPtr; ouPtr = G1CP_Testsuite_CheckOu("XXX_Ou");
    G1CP_Testsuite_CheckPassed();

    return G1CP_Testsuite_InspectOuString(ouPtr, "text", "Corrected");
};
