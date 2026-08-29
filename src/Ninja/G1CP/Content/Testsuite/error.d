/* Collect error details */
const string G1CP_TestsuiteMsg = "";

/*
 * Add error message (to be printed in the end)
 */
func void G1CP_TestsuiteErrorDetail(var string msg) {
    if (!Hlp_StrCmp(G1CP_TestsuiteMsg, "")) {
        G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, "|");
    };

    var int id; id = G1CP_Testsuite_FindCallerTestId();
    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, "  Test ");
    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, G1CP_LFill(IntToString(id), " ", G1CP_ID_LENGTH));
    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, ": ");
    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, msg);
};
func void G1CP_TestsuiteErrorDetail3(var string s1, var string s2, var string s3) {
    G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings(s1, s2), s3));
};

/*
 * Print error messages
 */
func void G1CP_TestsuitePrintErrors() {
    if (Hlp_StrCmp(G1CP_TestsuiteMsg, "")) {
        return;
    };
    var int count; count = STR_SplitCount(G1CP_TestsuiteMsg, "|");
    MEM_Info("");
    MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings(IntToString(count), " errors occurred."));
    repeat(i, count); var int i;
        MEM_SendToSpy(zERR_TYPE_FAULT, STR_Split(G1CP_TestsuiteMsg, "|", i));
    end;
    MEM_Info("");
    G1CP_TestsuiteMsg = "";
};

/*
 * Minimize and restore the spy on demand for performance/information
 */
func void G1CP_ShowSpy(var int show) {
    const int zerrPtr = 8821208; //0x8699D8
    var zERROR zerr; zerr = _^(zerrPtr);
    if (!zerr.spyHandle) {
        return;
    };

    const int SW_SHOWNOACTIVATE = 4;
    const int SW_MINIMIZE = 6;
    const int toggle = 0;

    if (show) {
        toggle = SW_SHOWNOACTIVATE;
    } else {
        toggle = SW_MINIMIZE;
    };

    if (CALL_Begin(call)) {
        const int call = 0;
        const int ShowWindow = 7713406; //0x75B27E
        CALL_IntParam(_@(toggle));
        CALL_IntParam(_@(zerr.spyHandle));
        CALL__stdcall(ShowWindow);
        call = CALL_End();
    };
};
