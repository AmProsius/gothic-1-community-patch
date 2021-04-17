/*
 * Check if integer variable exists
 */
func void G1CP_Testsuite_CheckIntVar(var string name, var int arrIdx) {
    if (!G1CP_IsIntVar(name, arrIdx)) {
        G1CP_TestsuiteErrorDetailSSS("Integer variable '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if integer constant exists
 */
func void G1CP_Testsuite_CheckIntConst(var string name, var int arrIdx) {
    if (!G1CP_IsIntConst(name, arrIdx)) {
        G1CP_TestsuiteErrorDetailSSS("Integer constant '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if string variable exists
 */
func void G1CP_Testsuite_CheckStringVar(var string name, var int arrIdx) {
    if (!G1CP_IsStringVar(name, arrIdx)) {
        G1CP_TestsuiteErrorDetailSSS("String variable '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if string constant exists
 */
func void G1CP_Testsuite_CheckStringConst(var string name, var int arrIdx) {
    if (!G1CP_IsStringConst(name, arrIdx)) {
        G1CP_TestsuiteErrorDetailSSS("String constant '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if info instance exists
 */
func void G1CP_Testsuite_CheckInfo(var string name) {
    // Check if info instance exists
    if (!G1CP_IsInfoInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("Info instance '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };

    // Check if info instance is available in info manager
    if (!G1CP_GetInfo(name)) {
        G1CP_TestsuiteErrorDetailSSS("Info instance '", name, "' not available");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if item instance exists
 */
func void G1CP_Testsuite_CheckItem(var string name) {
    if (!G1CP_IsItemInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("Item instance '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if function exists
 */
func void G1CP_Testsuite_CheckFunc(var string name, var string signature, var string funcType) {
    if (Hlp_StrCmp(funcType, "")) {
        funcType = "Function";
    };
    if (!G1CP_IsFunc(name, signature)) {
        G1CP_TestsuiteErrorDetailSSSS(funcType, " '", name, "' not found");
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if dialog function exists
 */
func void G1CP_Testsuite_CheckDialogFunc(var string name) {
    G1CP_Testsuite_CheckFunc(name, "void|none", "Dialog function");
};

/*
 * Check if dialog condition function exists
 */
func void G1CP_Testsuite_CheckDialogConditionFunc(var string name) {
    G1CP_Testsuite_CheckFunc(name, "int|none", "Dialog condition function");
};
