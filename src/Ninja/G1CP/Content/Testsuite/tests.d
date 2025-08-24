/*
 * Find the stack position of the origin test function that the call originated from.
 */
func int G1CP_Testsuite_FindCallerTestStackPos() {
    const string prefix = "G1CP_TEST_";
    const int prefixLen = 10;
    const int testFuncNameLen = prefixLen + G1CP_ID_LENGTH;

    var int ESP; ESP = MEM_GetFrameBoundary();
    while(MEMINT_IsFrameBoundary(ESP));
        ESP += MEMINT_DoStackFrameSize;
        var int stackPos; stackPos = ESP - MEMINT_DoStackPopPosOffset;
        var int popPos; popPos = MEM_ReadInt(stackPos);

        // In valid code stack bounds
        if (popPos < 0) || (popPos > MEM_Parser.stack_stacksize) {
            continue;
        };

        // Function name length matches that of a test function
        var int funcId; funcId = MEM_GetFuncIdByOffset(popPos);
        var string funcName; funcName = G1CP_GetSymbolName(funcId);
        if (STR_Len(funcName) != testFuncNameLen) {
            continue;
        };

        // Function name starts like a test function
        if (!STR_StartsWith(funcName, prefix)) {
            continue;
        };

        // Function name has a digit after the prefix
        var int chr; chr = STR_GetCharAt(funcName, prefixLen) - 48;
        if (chr < 0) || (chr > 9) {
            continue;
        };

        // Found!
        return stackPos;
    end;

    return 0;
};


/*
 * Find the test ID of the origin test function that the call originated from.
 */
func int G1CP_Testsuite_FindCallerTestId() {
    const int prefixLen = 10;
    var int stackPos; stackPos = G1CP_Testsuite_FindCallerTestStackPos();
    if (!stackPos) {
        return 0; // Not found
    };
    var int popPos; popPos = MEM_ReadInt(stackPos);
    var int funcId; funcId = MEM_GetFuncIdByOffset(popPos);
    var string funcName; funcName = G1CP_GetSymbolName(funcId);
    return STR_ToInt(STR_SubStr(funcName, prefixLen, G1CP_ID_LENGTH));
};


/*
 * Make the calling test immediately return, either false (FALSE) or true (TRUE) or nothing (-1).
 */
func void G1CP_Testsuite_ForceTestToReturn(var int ret) {
    G1CP_ForceNthCallerToReturn(ret, G1CP_Testsuite_FindCallerTestStackPos());
};
