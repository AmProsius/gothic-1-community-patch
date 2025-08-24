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
func void G1CP_TestsuiteErrorDetailSSS(var string s1, var string s2, var string s3) {
    G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings(s1, s2), s3));
};
func void G1CP_TestsuiteErrorDetailSIS(var string s1, var int i2, var string s3) {
    G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings(s1, IntToString(i2)), s3));
};
func void G1CP_TestsuiteErrorDetailSSSS(var string s1, var string s2, var string s3, var string s4) {
    G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings(ConcatStrings(s1, s2), s3), s4));
};
func void G1CP_TestsuiteErrorDetailSSSSS(var string s1, var string s2, var string s3, var string s4, var string s5) {
    G1CP_TestsuiteErrorDetail(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings(s1, s2), s3), s4), s5));
};
func void G1CP_TestsuiteErrorDetailSSSSSSS(var string s1, var string s2, var string s3, var string s4, var string s5,
    var string s6, var string s7) {
    G1CP_TestsuiteErrorDetail(
        ConcatStrings(
            ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings(s1, s2), s3), s4), s5), s6),
        s7)
    );
};
func void G1CP_TestsuiteErrorDetailSSSISSS(var string s1, var string s2, var string s3, var int i4, var string s5,
    var string s6, var string s7) {
    G1CP_TestsuiteErrorDetail(
        ConcatStrings(
            ConcatStrings(
                ConcatStrings(ConcatStrings(ConcatStrings(ConcatStrings(s1, s2), s3), IntToString(i4)), s5),
            s6),
        s7)
    );
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
