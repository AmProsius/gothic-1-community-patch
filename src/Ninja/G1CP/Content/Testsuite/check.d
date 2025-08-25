/*
 * Check if running automatic test
 */
func void G1CP_Testsuite_CheckManual() {
    if (!G1CP_TestsuiteAllowManual) {
        G1CP_Testsuite_ForceTestToReturn();
    };
};

/*
 * Check localization of the game and abort if it does not match
 */
 func void G1CP_Testsuite_CheckLang(var int lang) {
    if (!(G1CP_Lang & lang)) {
        // Get language name by given parameter
        var string langNames; langNames = "";
        if (lang & G1CP_Lang_EN) {
            langNames = ConcatStrings(langNames, " English");
        };
        if (lang & G1CP_Lang_DE) {
            langNames = ConcatStrings(langNames, " German");
        };
        if (lang & G1CP_Lang_PL) {
            langNames = ConcatStrings(langNames, " Polish");
        };
        if (lang & G1CP_Lang_RU) {
            langNames = ConcatStrings(langNames, " Russian");
        };
        G1CP_TestsuiteErrorDetailSSS("Test applicable for", langNames, " localization only");
        G1CP_Testsuite_ForceTestToReturn();
    };
 };

/*
 * Check if integer variable exists
 */
func int G1CP_Testsuite_CheckIntVar(var string name) {
    if (!G1CP_IsIntVar(name)) {
        G1CP_TestsuiteErrorDetailSSS("Integer variable '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetIntVarId(name); // Needed to handle array name decomposition "name[x]"
};

/*
 * Check if integer constant exists
 */
func int G1CP_Testsuite_CheckIntConst(var string name) {
    if (!G1CP_IsIntConst(name)) {
        G1CP_TestsuiteErrorDetailSSS("Integer constant '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetIntConstId(name);
};

/*
 * Check if string variable exists
 */
func int G1CP_Testsuite_CheckStringVar(var string name) {
    if (!G1CP_IsStringVar(name)) {
        G1CP_TestsuiteErrorDetailSSS("String variable '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetStringVarId(name);
};

/*
 * Check if string constant exists
 */
func int G1CP_Testsuite_CheckStringConst(var string name) {
    if (!G1CP_IsStringConst(name)) {
        G1CP_TestsuiteErrorDetailSSS("String constant '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return G1CP_GetStringConstId(name);
};

/*
 * Check if info instance exists
 */
func int G1CP_Testsuite_CheckInfo(var string name) {
    if (!G1CP_IsInfoInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("Info instance '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if item instance exists
 */
func int G1CP_Testsuite_CheckItem(var string name) {
    if (!G1CP_IsItemInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("Item instance '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if NPC instance exists
 */
func int G1CP_Testsuite_CheckNpc(var string name) {
    if (!G1CP_IsNpcInst(name)) {
        G1CP_TestsuiteErrorDetailSSS("NPC instance '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if function exists
 */
func int G1CP_Testsuite_CheckFunc(var string name, var string signature, var string funcType) {
    if (Hlp_StrCmp(funcType, "")) {
        funcType = "Function";
    };
    if (!G1CP_IsFunc(name, signature)) {
        G1CP_TestsuiteErrorDetailSSSS(funcType, " '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return -1;
    };
    return MEM_GetSymbolIndex(name);
};

/*
 * Check if dialog function exists
 */
func int G1CP_Testsuite_CheckDialogFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "Dialog function");
};

/*
 * Check if dialog condition function exists
 */
func int G1CP_Testsuite_CheckDialogConditionFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "int|none", "Dialog condition");
};

/*
 * Check if daily routine function exists
 */
func int G1CP_Testsuite_CheckRoutineFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "Daily routine");
};

/*
 * Check if AI state start function exists
 */
func int G1CP_Testsuite_CheckAiStateStartFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "AI state");
};

/*
 * Check if AI state loop function exists
 */
func int G1CP_Testsuite_CheckAiStateLoopFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "|none", "AI state loop"); // Returns either int or void
};

/*
 * Check if AI state end function exists
 */
func int G1CP_Testsuite_CheckAiStateEndFunc(var string name) {
    return G1CP_Testsuite_CheckFunc(name, "void|none", "AI state end");
};

/*
 * Check if AI state (all functions) exists
 */
func void G1CP_Testsuite_CheckAiState(var string name) {
    var int i;
    i = G1CP_Testsuite_CheckAiStateStartFunc(name);
    i = G1CP_Testsuite_CheckAiStateLoopFunc(ConcatStrings(name, "_Loop"));
    i = G1CP_Testsuite_CheckAiStateEndFunc(ConcatStrings(name, "_End"));
};

/*
 * Check if an output unit exists
 */
func int G1CP_Testsuite_CheckOu(var string name) {
    var int ptr; ptr = G1CP_GetOu(name);
    if (!ptr) {
        G1CP_TestsuiteErrorDetailSSS("Output unit '", name, "' not found");
        G1CP_Testsuite_FailTest();
        return 0;
    };
    return ptr;
};
