/*
 * Apply a fix from within a test. Only reasonable for revertible fixes.
 */
func void G1CP_Testsuite_ApplyFix(var int fixId) {
    // Only apply if not active (cannot be disabled!)
    if (G1CP_GetFixStatus(fixId) != G1CP_FIX_NOT_APPLIED) {
        return;
    };

    // Build apply function name
    var string funcName; funcName = "G1CP_";
    funcName = ConcatStrings(funcName, G1CP_LFill(IntToString(fixId), "0", G1CP_ID_LENGTH));
    funcName = ConcatStrings(funcName, "_");
    funcName = ConcatStrings(funcName, G1CP_GetFixShortName(fixId));

    // Check if apply function exists
    var int funcId; funcId = G1CP_GetFuncId(funcName, "int|none");
    if (funcId == -1 ) {
        return;
    };

    MEM_CallById(funcId);
    var int ret; ret = MEM_PopIntResult();
    G1CP_SetFixStatus(fixId, ret);
};


/*
 * Revert a fix from within a test. Only works on revertible fixes. Throws no error on failure.
 */
func void G1CP_Testsuite_RevertFix(var int fixId) {
    // Only revert if applied
    if (G1CP_GetFixStatus(fixId) != G1CP_FIX_APPLIED) {
        return;
    };

    // Build revert function name
    var string funcName; funcName = "G1CP_";
    funcName = ConcatStrings(funcName, G1CP_LFill(IntToString(fixId), "0", G1CP_ID_LENGTH));
    funcName = ConcatStrings(funcName, "_");
    funcName = ConcatStrings(funcName, G1CP_GetFixShortName(fixId));
    funcName = ConcatStrings(funcName, "REVERT");

    // Check if revert function exists
    var int funcId; funcId = G1CP_GetFuncId(funcName, "int|none");
    if (funcId == -1 ) {
        return;
    };

    MEM_CallById(funcId);
    var int ret; ret = MEM_PopIntResult();
    G1CP_SetFixStatus(fixId, !ret);
};


/*
 * Shortcut for re-applying a revertible fix.
 */
func void G1CP_Testsuite_ReapplyFix() {
    var int fixId; fixId = G1CP_Testsuite_FindCallerTestId();
    G1CP_Testsuite_RevertFix(fixId);
    G1CP_Testsuite_ApplyFix(fixId);
};
