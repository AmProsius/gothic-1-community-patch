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

/*
 * Check if instance integer variable exists and return it
 * The instance needs to be checked and assigned before hand
 */
func int G1CP_Testsuite_GetInstIntVar(var int inst, var string prop) {
    // Get address to instance
    var MEMINT_HelperClass obj; obj = MEM_CpyInst(inst);
    var int addr; addr = _@(obj);

    // Get class and check class integer variable
    var zCPar_Symbol symb; symb = _PM_ToClass(inst);
    var string symbName; symbName = ConcatStrings(ConcatStrings(symb.name, "."), prop);
    var int symbId; symbId = G1CP_Testsuite_CheckIntVar(symbName);
    var int arrIdx; arrIdx = G1CP_DecomposeArraySymbolName(_@s(symbName));

    // Read property
    symb = _^(MEM_GetSymbolByIndex(symbId));
    return MEM_ReadIntArray(addr + symb.offset, arrIdx);
};

/*
 * Check if instance string variable exists and return it
 * The instance needs to be checked and assigned before hand
 */
func string G1CP_Testsuite_GetInstStringVar(var int inst, var string prop) {
    // Get address to instance
    var MEMINT_HelperClass obj; obj = MEM_CpyInst(inst);
    var int addr; addr = _@(obj);

    // Get class and check class integer variable
    var zCPar_Symbol symb; symb = _PM_ToClass(inst);
    var string symbName; symbName = ConcatStrings(ConcatStrings(symb.name, "."), prop);
    var int symbId; symbId = G1CP_Testsuite_CheckStringVar(symbName);
    var int arrIdx; arrIdx = G1CP_DecomposeArraySymbolName(_@s(symbName));

    // Read property
    symb = _^(MEM_GetSymbolByIndex(symbId));
    return MEM_ReadStringArray(addr + symb.offset, arrIdx);
};
