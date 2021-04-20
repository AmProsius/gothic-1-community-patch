/*
 * Check if integer variable exists and return it
 */
func int G1CP_Testsuite_GetIntVar(var string name, var int arrIdx) {
    var int varId; varId = G1CP_Testsuite_CheckIntVar(name, arrIdx);

    return G1CP_GetIntVarI(varId, arrIdx, 0);
};

/*
 * Check if integer constant exists and return it
 */
func int G1CP_Testsuite_GetIntConst(var string name, var int arrIdx) {
    var int constId; constId = G1CP_Testsuite_CheckIntConst(name, arrIdx);

    return G1CP_GetIntConstI(constId, arrIdx, 0);
};

/*
 * Check if string variable exists and return it
 */
func string G1CP_Testsuite_GetStringVar(var string name, var int arrIdx) {
    var int varId; varId = G1CP_Testsuite_CheckStringVar(name, arrIdx);

    return G1CP_GetStringVarI(varId, arrIdx, "G1CP invalid string");
};

/*
 * Check if string constant exists and return it
 */
func string G1CP_Testsuite_GetStringConst(var string name, var int arrIdx) {
    var int constId; constId = G1CP_Testsuite_CheckStringConst(name, arrIdx);

    return G1CP_GetStringConstI(constId, arrIdx, "G1CP invalid string");
};
