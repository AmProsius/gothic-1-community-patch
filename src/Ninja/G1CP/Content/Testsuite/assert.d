/*
 * Assert that test passed (integer assertion).
 */
func void G1CP_Testsuite_Assert(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (expected != actual) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected "); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};


/*
 * Assert that test passed (string assertion).
 */
func void G1CP_Testsuite_AssertS(var string actual, var string expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (STR_Compare(expected, actual) != STR_EQUAL) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected '"); SB(expected); SB("',");
            SB(" got '"); SB(actual); SB("'.");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};


/*
 * Assert integer inequalities.
 */
func void G1CP_Testsuite_AssertNe(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (actual == expected) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected !"); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};
func void G1CP_Testsuite_AssertGt(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (!(actual > expected)) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected greater than "); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};
func void G1CP_Testsuite_AssertGe(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (!(actual >= expected)) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected greater than or equal to "); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};
func void G1CP_Testsuite_AssertLt(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (!(actual < expected)) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected less than "); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};
func void G1CP_Testsuite_AssertLe(var int actual, var int expected) {
    G1CP_TestsuiteAssertNum += 1; // Keep track of which assertion failed

    if (!(actual <= expected)) {
        if (SB_New()) {
            SB("Assertion #"); SBi(G1CP_TestsuiteAssertNum);
            SB(" expected less than or equal to "); SBi(expected); SB(",");
            SB(" got "); SBi(actual); SB(".");
            G1CP_TestsuiteErrorDetail(SB_ToString());
            SB_Destroy();
        };
        G1CP_Testsuite_ForceTestToReturn(FALSE);
    };
};
