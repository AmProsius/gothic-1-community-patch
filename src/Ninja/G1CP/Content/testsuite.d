/*
 * Test suite
 *
 * Tests are called from the console with 'test ID' or 'test all'.
 * The corresponding functions 'Ninja_G1CP_Test_000' (three digits) are called if found.
 *
 * The test functions should either return TRUE (if passed) or FALSE (if failed). They may also have no
 * return type, then they will be marked as to be manually confirmed.
 *
 * Errors and other messages should not be reported to the zSpy directly but using this function instead
 *    Ninja_G1CP_TestsuiteErrorDetail(int testNr, string message)
 *
 * Tests that require manual confirmation from the user typically have to teleport the hero or similar. This would
 * interfere when all tests are run at once (i.e. 'test all'). Therefore, before any such actions are taken, the test
 * function should check whether 'Ninja_G1CP_TestsuiteAllowManual' is TRUE. This is the case when the test is run
 * specifically with 'test ID'.
 */

/* Collect error details */
const string Ninja_G1CP_TestsuiteMsg = "";

/* Allow or disallow manual tests */
const int Ninja_G1CP_TestsuiteAllowManual = 0;

/*
 * Initialization function
 */
func void Ninja_G1CP_Testsuite() {
    CC_Register(Ninja_G1CP_TestsuiteAll, "test all", "Run complete test suite for G1CP");
    CC_Register(Ninja_G1CP_TestsuiteCmd, "test ", "Run test from test suite for G1CP");
};

/*
 * Run test by id
 */
func int Ninja_G1CP_TestsuiteRun(var int id) {
    var string idName; idName = Ninja_G1CP_LFill(IntToString(id), "0", 3);

    // Find test function
    var string funcName; funcName = ConcatStrings("Ninja_G1CP_Test_", idName);
    var int symbPtr; symbPtr = MEM_GetSymbol(funcName);
    if (!symbPtr) {
        return -1;
    };

    // Call test function and return
    MEM_CallByString(funcName);
    if (MEM_ReadInt(symbPtr+zCParSymbol_offset_offset) == (zPAR_TYPE_INT >> 12)) {
        return MEM_PopIntResult();
    };
    return 2; // = No output
};

/*
 * Add error message (to be printed in the end)
 */
func void Ninja_G1CP_TestsuiteErrorDetail(var int id, var string msg) {
    if (!Hlp_StrCmp(Ninja_G1CP_TestsuiteMsg, "")) {
        Ninja_G1CP_TestsuiteMsg = ConcatStrings(Ninja_G1CP_TestsuiteMsg, "|");
    };
    Ninja_G1CP_TestsuiteMsg = ConcatStrings(Ninja_G1CP_TestsuiteMsg, "  Test ");
    Ninja_G1CP_TestsuiteMsg = ConcatStrings(Ninja_G1CP_TestsuiteMsg, Ninja_G1CP_LFill(IntToString(id), "0", 3));
    Ninja_G1CP_TestsuiteMsg = ConcatStrings(Ninja_G1CP_TestsuiteMsg, ": ");
    Ninja_G1CP_TestsuiteMsg = ConcatStrings(Ninja_G1CP_TestsuiteMsg, msg);
};

/*
 * Print error messages
 */
func void Ninja_G1CP_TestsuitePrintErrors() {
    if (Hlp_StrCmp(Ninja_G1CP_TestsuiteMsg, "")) {
        return;
    };
    var int count; count = STR_SplitCount(Ninja_G1CP_TestsuiteMsg, "|");
    MEM_Info("");
    MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings(IntToString(count), " errors occurred."));
    repeat(i, count); var int i;
        MEM_SendToSpy(zERR_TYPE_FAULT, STR_Split(Ninja_G1CP_TestsuiteMsg, "|", i));
    end;
    MEM_Info("");
};

/*
 * Command handler
 */
func string Ninja_G1CP_TestsuiteAll(var string _) {
    var int passed; passed = 0;
    var int failed; failed = 0;
    var int manual; manual = 0;
    var string msg;
    var string infos; infos = "";

    // Do not trigger manual tests
    Ninja_G1CP_TestsuiteAllowManual = FALSE;

    // Iterate over and call all tests
    repeat(i, currSymbolTableLength); var int i;
        var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(i));
        if (STR_StartsWith(symb.name, "NINJA_G1CP_TEST_"))
        && (STR_Len(symb.name) == 19)
        && ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_FUNC) {
            msg = ConcatStrings(STR_SubStr(symb.name, 11, 8), " .... ");
            MEM_CallByID(i);
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

    // Print error details
    Ninja_G1CP_TestsuitePrintErrors();
    Ninja_G1CP_TestsuiteMsg = "";

    msg = IntToString(passed);
    msg = ConcatStrings(msg, " passed, ");
    msg = ConcatStrings(msg, IntToString(failed));
    msg = ConcatStrings(msg, " failed, ");
    msg = ConcatStrings(msg, IntToString(manual));
    msg = ConcatStrings(msg, " require manual confirmation. See zSpy for details.");
    return msg;

};

func string Ninja_G1CP_TestsuiteCmd(var string command) {
    var int retInt;
    var string retStr;

    // Allow to trigger manual tests
    Ninja_G1CP_TestsuiteAllowManual = TRUE;

    // Reset error details
    Ninja_G1CP_TestsuiteMsg = "";

    retInt = Ninja_G1CP_TestsuiteRun(STR_ToInt(command));
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
    Ninja_G1CP_TestsuitePrintErrors();
    Ninja_G1CP_TestsuiteMsg = "";

    return retStr;
};
