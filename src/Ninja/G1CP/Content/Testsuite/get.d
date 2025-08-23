/*
 * Check if integer variable exists and return it
 */
func int G1CP_Testsuite_GetIntVar(var string name) {
    var int varId; varId = G1CP_Testsuite_CheckIntVar(name);
    return G1CP_GetIntVar(name, 0);
};

/*
 * Check if integer constant exists and return it
 */
func int G1CP_Testsuite_GetIntConst(var string name) {
    var int constId; constId = G1CP_Testsuite_CheckIntConst(name);
    return G1CP_GetIntConst(name, 0);
};

/*
 * Check if string variable exists and return it
 */
func string G1CP_Testsuite_GetStringVar(var string name) {
    var int varId; varId = G1CP_Testsuite_CheckStringVar(name);
    return G1CP_GetStringVar(name, "G1CP invalid string");
};

/*
 * Check if string constant exists and return it
 */
func string G1CP_Testsuite_GetStringConst(var string name) {
    var int constId; constId = G1CP_Testsuite_CheckStringConst(name);
    return G1CP_GetStringConst(name, "G1CP invalid string");
};
