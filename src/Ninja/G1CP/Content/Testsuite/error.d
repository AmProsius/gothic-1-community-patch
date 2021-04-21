/* Collect error details */
const string G1CP_TestsuiteMsg = "";

/*
 * Add error message (to be printed in the end)
 */
func void G1CP_TestsuiteErrorDetail(var string msg) {
    if (!Hlp_StrCmp(G1CP_TestsuiteMsg, "")) {
        G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, "|");
    };

    // Obtain test number: Find the test function that that the call originated from
    var int id; id = 0;
    var int ESP; ESP = MEM_GetFrameBoundary();
    while(MEMINT_IsFrameBoundary(ESP) && (!id));
        ESP += MEMINT_DoStackFrameSize;
        var int popPos; popPos = MEM_ReadInt(ESP - MEMINT_DoStackPopPosOffset);
        if (popPos > 0) && (popPos < MEM_Parser.stack_stacksize) {
            var int funcId; funcId = MEM_GetFuncIdByOffset(popPos);
            var string funcName; funcName = G1CP_GetSymbolName(funcId);
            var int prefixLen; prefixLen = STR_Len("G1CP_Test_000");
            if (STR_Len(funcName) >= prefixLen) {
                var int chr; chr = STR_GetCharAt(funcName, prefixLen-3) - 48;
                if (0 <= chr) && (chr <= 9) {
                    id = STR_ToInt(STR_SubStr(funcName, prefixLen-3, 3));
                };
            };
        };
    end;

    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, "  Test ");
    G1CP_TestsuiteMsg = ConcatStrings(G1CP_TestsuiteMsg, G1CP_LFill(IntToString(id), " ", 3));
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
