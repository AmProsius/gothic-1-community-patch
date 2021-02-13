/*
 * The function that this is called from, is wrapped by a text indent in the zSpy and preceded by a message.
 * This helps to identify the origin function of possible crashes or bugs from the zSpy output.
 * The end of the function can only be reliably determined if it was not called from the engine. Indentation is omitted
 * in that case.
 * The outputs are only shown for zSpy level >= 6. For lower or no zSpy level this entire function will not be called.
 */
func void Ninja_G1CP_ReportFuncToSpy() {
    const int level = 6; // Minimum zSpy level to show

    // Get information of the calling function
    var int namePtr;
    var int posStart; posStart = MEM_GetCallerStackPos();
    var int callerId; callerId = MEM_GetFuncIDByOffset(posStart);
    if (callerId > 0) && (callerId < currSymbolTableLength) {
        // Symbol name of the caller
        namePtr = MEM_GetSymbolByIndex(callerId);
    } else {
        // No function came for dynamically created code
        namePtr = _@s("UNKNOWN");
    };

    // This is MEM_SetCallerStackPos but another layer up
    var int ret; ret = MEM_ReadInt(MEM_GetFrameBoundary() + 3*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset);

    // Check whether the function that was called, called by another function or by the engine
    // var int doNotIndent; doNotIndent = (ret == 0); // Wrapping the end of the function is unstable (never unindented)
    var int doNotIndent; doNotIndent = TRUE; // Skipped for now

    // Retrieve symbol IDs and offsets only once
    const int indent_offset         = -1;
    const int str_id                = -1;
    const int concatstrings_id      = -1;
    const int mem_readstring_offset = -1;
    const int mem_infoext_offset    = -1;
    const string str = "Calling ";
    if (indent_offset == -1) {
        indent_offset = MEM_GetFuncOffset(Ninja_G1CP_zSpyIndent);
        concatstrings_id = MEM_GetFuncID(ConcatStrings);
        mem_readstring_offset = MEM_GetFuncOffset(MEM_ReadString);
        mem_infoext_offset = MEM_GetFuncOffset(Ninja_G1CP_MEM_InfoLvl);
        str_id = MEM_FindParserSymbol("Ninja_G1CP_ReportFuncToSpy.str");
    };

    var int ptr;
    var int popPos;

    // Inject bytes before the function is called
    ptr = MEM_Alloc(51);
    MEMINT_OverrideFunc_Ptr = ptr;
    MEMINT_OFTokPar(zPAR_TOK_PUSHVAR,     str_id);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT,     namePtr);
    MEMINT_OFTokPar(zPAR_TOK_CALL,        mem_readstring_offset);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN,  concatstrings_id);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT,     level);
    MEMINT_OFTokPar(zPAR_TOK_CALL,        mem_infoext_offset);
    if (!doNotIndent) { // Do not indent if the end of the function cannot be intercepted to un-indent
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, namePtr);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    mem_readstring_offset);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    indent_offset);
    };
    MEMINT_OFTok(zPAR_TOK_RET);
    popPos = ptr - currParserStackAddress;
    // Replace the call to here
    MEM_WriteInt(posStart+currParserStackAddress-4, popPos);

    // Inject bytes after the function is called
    if (!doNotIndent) { // Not possible if the function was called by the engine
        ptr = MEM_Alloc(25);
        MEMINT_OverrideFunc_Ptr = ptr;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, namePtr);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    mem_readstring_offset);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, -1);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    indent_offset);
        MEMINT_OFTokPar(zPAR_TOK_JUMP,    ret);
        popPos = ptr - currParserStackAddress;
        // Replace the return offset
        MEM_WriteInt(MEM_GetFrameBoundary() + 3*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset, popPos);
    };

    // Finally, jump before the call to this very function to execute the just overwritten bytes and continue there
    MEM_SetCallerStackPos(posStart-5);
};
