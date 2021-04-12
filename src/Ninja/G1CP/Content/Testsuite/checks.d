/*
 * Check if item exists
 */
func void G1CP_Testsuite_CheckItem(var string name) {
    if (!G1CP_IsItemInst(name)) {
        var string msg; msg = ConcatStrings("Item '", name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if item exists and return its symbol index
 */
func int G1CP_Testsuite_GetItemId(var string name) {
    // Check if item instance exists
    G1CP_Testsuite_CheckItem(name);

    // Return the item's symbol index
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if integer variable exists
 */
func void G1CP_Testsuite_CheckIntVar(var string name, var int arrIdx) {
    if (!G1CP_IsIntVar(name, arrIdx)) {
        var string msg; msg = ConcatStrings("Integer variable '", name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if integer constant exists
 */
func void G1CP_Testsuite_CheckIntConst(var string name, var int arrIdx) {
    if (!G1CP_IsIntConst(name, arrIdx)) {
        var string msg; msg = ConcatStrings("Integer constant '", name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if info instance exists
 */
func void G1CP_Testsuite_CheckInfo(var string name) {
    // Check if info instance exists
    if (!G1CP_IsInfoInst(name)) {
        var string msg; msg = ConcatStrings("Info instance '", name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
    };

    // Check if info instance is available in info manager
    if (!G1CP_GetInfo(name)) {
        var string msg; msg = ConcatStrings("Info instance '", name);
        msg = ConcatStrings(msg, "' not available");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
    };
};

/*
 * Check if info instance exists and return its symbol index
 */
func int G1CP_Testsuite_GetInfoId(var string name) {
    // Check if info instance exists
    G1CP_Testsuite_CheckInfo(name);

    // Return the info instance's symbol index
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if function exists
 */
func void G1CP_Testsuite_CheckFunc(var string name, var string signature, var string funcType) {
    if (Hlp_StrCmp(funcType, "")) {
        funcType = "Function";
    };
    if (!G1CP_IsFunc(name, signature)) {
        var string msg; msg = ConcatStrings(funcType, " '");
        msg = ConcatStrings(msg, name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
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

/*
 * Check if NPC exists and return it
 */
func MEMINT_HelperClass G1CP_Testsuite_GetNpc(var string name) {
    var string msg;

    // Check if NPC instance exists
    if (!G1CP_IsNpcInst(name)) {
        msg = ConcatStrings("NPC '", name);
        msg = ConcatStrings(msg, "' not found");
        G1CP_TestsuiteErrorDetail(msg);
        G1CP_TestsuiteStatusPassed = FALSE;
        MEM_NullToInst();
    } else {
        var int symbId; symbId = MEM_GetSymbolIndex(name);
        var C_Npc npc; npc = Hlp_GetNpc(symbId);
        if (!Hlp_IsValidNpc(npc)) {
            msg = ConcatStrings("NPC '", name);
            msg = ConcatStrings(msg, "' not valid");
            G1CP_TestsuiteErrorDetail(msg);
            G1CP_TestsuiteStatusPassed = FALSE;
            MEM_NullToInst();
        } else {
            // Return NPC
            MEMINT_StackPushInst(npc);
        };
    };
};
