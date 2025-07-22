/*
 * Test suite
 *
 * Tests are called from the console with 'test ID' or 'test all'.
 * The corresponding functions 'G1CP_Test_0000' (digits equal to G1CP_ID_LENGTH) are called if found.
 *
 * The test functions should either return TRUE (if passed) or FALSE (if failed). They may also have no
 * return type, then they will be marked as to be manually confirmed.
 *
 * Errors and other messages should not be reported to the zSpy directly but using this function instead
 *    G1CP_TestsuiteErrorDetail(string message)
 *
 * Tests that require manual confirmation from the user typically have to teleport the hero or similar. This would
 * interfere when all tests are run at once (i.e. 'test all'). Therefore, before any such actions are taken, the test
 * function should check whether 'G1CP_TestsuiteAllowManual' is TRUE. This is the case when the test is run
 * specifically with 'test ID'.
 */

/* Allow or disallow manual tests */
const int G1CP_TestsuiteAllowManual = FALSE;

/* Check if test passes */
const int G1CP_TestsuiteStatusPassed = TRUE;

/* Keep track of the next symbol index for iterating over tests */
const int G1CP_TestsuiteNext_SymbId = 0;

/*
 * Initialization function
 */
func int G1CP_Testsuite() {
    CC_Register(G1CP_TestsuiteList, "test list", "List all tests of G1CP");
    CC_Register(G1CP_TestsuiteNext, "test next", "Execute next manual test of G1CP");
    CC_Register(G1CP_TestsuiteAll, "test all", "Run complete test suite for G1CP");
    CC_Register(G1CP_TestsuiteActive, "test active", "Run test suite on all active fixes of G1CP");
    CC_Register(G1CP_TestsuiteCmd, "test ", "Run test from test suite for G1CP");

    // Confirm registration
    return ((CC_Active(G1CP_TestsuiteList))
         && (CC_Active(G1CP_TestsuiteAll))
         && (CC_Active(G1CP_TestsuiteCmd)));
};

/*
 * Run test by id
 */
func int G1CP_TestsuiteRun(var int id) {
    var string idName; idName = G1CP_LFill(IntToString(id), "0", G1CP_ID_LENGTH);

    // Reset test status
    G1CP_TestsuiteStatusPassed = TRUE;

    // Find test function
    var string funcName; funcName = ConcatStrings("G1CP_Test_", idName);
    var int symbPtr; symbPtr = MEM_GetSymbol(funcName);
    if (!symbPtr) {
        return -1;
    };

    // Update the iterator
    G1CP_TestsuiteNext_SymbId = MEM_GetSymbolIndex(funcName) + 1;

    // Call test function and return
    MEM_CallByString(funcName);
    if (MEM_ReadInt(symbPtr+zCParSymbol_offset_offset) == (zPAR_TYPE_INT >> 12)) {
        return MEM_PopIntResult();
    };
    return 2; // = No output
};

/*
 * Run multiple tests at once
 */
func string G1CP_TestsuiteRunMultiple(var int appliedOnly) {
    var int passed; passed = 0;
    var int failed; failed = 0;
    var int manual; manual = 0;
    var string msg;
    var string infos; infos = "";

    // Do not trigger manual tests
    G1CP_TestsuiteAllowManual = FALSE;

    // Reset error details
    G1CP_TestsuiteMsg = "";

    // Remember the data stack position
    var int stkPosBefore; stkPosBefore = MEM_Parser.datastack_sptr;

    // Iterate over and call all tests
    repeat(i, G1CP_SymbEnd); var int i; if (!i) { i = G1CP_SymbStart; }; // From SymbStart to SymbEnd

        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, "G1CP_TEST_"))
        && (STR_Len(symb.name) == 10 + G1CP_ID_LENGTH)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            // Test name
            msg = STR_SubStr(symb.name, 5, G1CP_ID_LENGTH + 5);

            // Check if currently applied or not
            var int id; id = STR_ToInt(STR_SubStr(symb.name, 10, G1CP_ID_LENGTH));
            if (G1CP_IsFixApplied(id)) {
                msg = ConcatStrings(msg, " .");
            } else if (appliedOnly) {
                // Skip tests of inactive fixes
                continue;
            } else {
                msg = ConcatStrings(msg, "* ");
            };
            msg = ConcatStrings(msg, "... ");

            // Reset test status before every test
            G1CP_TestsuiteStatusPassed = TRUE;

            // Reset the data stack position and call the test function
            MEM_Parser.datastack_sptr = stkPosBefore;
            MEM_CallById(i);

            if (symb.offset == (zPAR_TYPE_INT >> 12)) {
                if (MEM_PopIntResult()) {
                    msg = ConcatStrings(msg, "[PASSED]|");
                    infos = ConcatStrings(infos, msg);
                    passed += 1;
                } else {
                    msg = ConcatStrings(msg, "[FAILED]|");
                    infos = ConcatStrings(infos, msg);
                    failed += 1;
                };
            } else {
                msg = ConcatStrings(msg, "[MANUAL]|");
                infos = ConcatStrings(infos, msg);
                manual += 1;
            };
        };
    end;

    // Print infos (afterwards all together)
    MEM_Info("");
    var int count; count = STR_SplitCount(infos, "|");
    repeat(i, count-1);
        msg = STR_Split(infos, "|", i);
        if (STR_IndexOf(msg, "PASSED") != -1) {
            MEM_SendToSpy(zERR_TYPE_WARN, msg);
        } else if (STR_IndexOf(msg, "FAILED") != -1) {
            MEM_SendToSpy(zERR_TYPE_FAULT, msg);
        } else {
            MEM_SendToSpy(zERR_TYPE_INFO, msg);
        };
    end;
    MEM_Info("");

    // Print error details
    G1CP_TestsuitePrintErrors();

    msg = IntToString(passed);
    msg = ConcatStrings(msg, " passed, ");
    msg = ConcatStrings(msg, IntToString(failed));
    msg = ConcatStrings(msg, " failed, ");
    msg = ConcatStrings(msg, IntToString(manual));
    msg = ConcatStrings(msg, " require manual confirmation. See zSpy for details.");
    return msg;
};

/*
 * Command handlers
 */
func string G1CP_TestsuiteAll(var string _) {
    return G1CP_TestsuiteRunMultiple(FALSE);
};

func string G1CP_TestsuiteActive(var string _) {
    return G1CP_TestsuiteRunMultiple(TRUE);
};

func string G1CP_TestsuiteCmd(var string command) {
    var int retInt;
    var string retStr;

    // Allow to trigger manual tests
    G1CP_TestsuiteAllowManual = TRUE;

    // Reset error details
    G1CP_TestsuiteMsg = "";

    retInt = G1CP_TestsuiteRun(STR_ToInt(command));
    if (retInt == -1) {
        retStr = "";
    } else if (retInt == 2) {
        retStr = "EXECUTED. Manual confirmation needed.";
    } else if (retInt == TRUE) {
        retStr = "PASSED";
    } else {
        retStr = "FAILED";
    };

    // Print error details
    G1CP_TestsuitePrintErrors();

    return retStr;
};

func string G1CP_TestsuiteNext(var string _) {
    // Restart from the beginning
    if (G1CP_TestsuiteNext_SymbId < G1CP_SymbStart) || (G1CP_TestsuiteNext_SymbId >= G1CP_SymbEnd) {
        G1CP_TestsuiteNext_SymbId = G1CP_SymbStart;
    };

    // Iterate over symbols and find next manual test
    while(G1CP_TestsuiteNext_SymbId < G1CP_SymbEnd);
        // Compare symbol name
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(G1CP_TestsuiteNext_SymbId));
        if (STR_StartsWith(symb.name, "G1CP_TEST_"))
        && (STR_Len(symb.name) == 13)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            // Get test ID
            var int id; id = STR_ToInt(STR_SubStr(symb.name, 10, G1CP_ID_LENGTH));

            // Check if manual or automatic
            if (symb.offset == (zPAR_TYPE_VOID >> 12)) {
                break;
            };
        };
        G1CP_TestsuiteNext_SymbId += 1;
    end;

    // Reached last
    if (G1CP_TestsuiteNext_SymbId >= G1CP_SymbEnd) {
        return "Reached end of manual tests. Will restart from the beginning on next call";
    };

    // Otherwise execute test (advances the iterator)
    G1CP_TestsuiteCmd(IntToString(id));

    // Return info
    var string msg; msg = "Start test of #";
    msg = ConcatStrings(msg, IntToString(id));
    msg = ConcatStrings(msg, " '");
    msg = ConcatStrings(msg, G1CP_GetFixShortName(id));
    msg = ConcatStrings(msg, "'");
    return msg;
};

func string G1CP_TestsuiteList(var string _) {
    var string automatic; automatic = "Automatic: ";
    var string manual;    manual    = "Manual:    ";

    // Iterate over and call all tests
    repeat(i, G1CP_SymbEnd); var int i; if (!i) { i = G1CP_SymbStart; }; // From SymbStart to SymbEnd

        // Compare symbol name
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, "G1CP_TEST_"))
        && (STR_Len(symb.name) == 13)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            var string msg;

            // Get test ID
            var int id; id = STR_ToInt(STR_SubStr(symb.name, 10, G1CP_ID_LENGTH));
            msg = IntToString(id); // Trim leading zeros

            // Check if fix is not applied
            if (!G1CP_IsFixApplied(id)) {
                msg = ConcatStrings(ConcatStrings("(", msg), ")");
            };

            // Check if manual or automatic
            if (symb.offset == (zPAR_TYPE_INT >> 12)) {
                automatic = ConcatStrings(ConcatStrings(automatic, msg), " ");
            } else {
                manual = ConcatStrings(ConcatStrings(manual, msg), " ");
            };
        };
    end;

    // Remove trailing commas
    automatic = STR_Prefix(automatic, STR_Len(automatic)-1);
    manual = STR_Prefix(manual, STR_Len(manual)-1);

    // Format and return strings
    var string ret;
    if (SB_New()) {
        SB(automatic);
        if (Hlp_StrCmp(automatic, "Automatic:")) {
            SB(" None");
        };
        SBc(10);
        SBc(13);
        SB(manual);
        if (Hlp_StrCmp(manual, "Manual:   ")) {
            SB(" None");
        };
        ret = SB_ToString();
        SB_Destroy();
    };

    return ret;
};
