/*
 * The function that this is called from, is wrapped by a text indent in the zSpy and preceded by a message.
 * This helps to identify the origin function of possible crashes or bugs from the zSpy output.
 * The end of the function can only be reliably determined if it was not called from the engine. Indentation is omitted
 * in that case.
 * The outputs are only shown if debugging is enabled for the channel defined below.
 */
func void G1CP_ReportFuncToSpy() {
    const int channel = 31; // Debug channel

    // Get information of the calling function
    var int namePtr;
    var int posStart; posStart = MEM_GetCallerStackPos();
    var int callerId; callerId = MEM_GetFuncIdByOffset(posStart);
    if (callerId > 0) && (callerId < MEM_Parser.symtab_table_numInArray) {
        // Symbol name of the caller
        namePtr = MEM_GetSymbolByIndex(callerId);
    } else {
        // No function came for dynamically created code
        namePtr = _@s("UNKNOWN");
    };

    // This is MEM_GetCallerStackPos but another layer up
    var int ret; ret = MEM_ReadInt(MEM_GetFrameBoundary() + 3*MEMINT_DoStackFrameSize - MEMINT_DoStackPopPosOffset);

    // Check whether the function that was called, called by another function or by the engine
    //var int doNotIndent; doNotIndent = (ret <= 0) || (ret >= MEM_Parser.stack_stacksize);
    var int doNotIndent; doNotIndent = TRUE; // Disabled for now. Wrapping the end of the function is unstable

    // Retrieve symbol IDs and offsets only once
    const int indent_offset         = -1;
    const int str_id                = -1;
    const int concatstrings_id      = -1;
    const int mem_readstring_offset = -1;
    const int printdebug_ch_id      = -1;
    const int set_caller_2fr_offset = -1;
    const string str = "Calling ";
    if (indent_offset == -1) {
        indent_offset = MEM_GetFuncOffset(G1CP_zSpyIndent);
        concatstrings_id = MEM_GetFuncId(ConcatStrings);
        mem_readstring_offset = MEM_GetFuncOffset(MEM_ReadString);
        printdebug_ch_id = MEM_GetFuncId(PrintDebugCh);
        set_caller_2fr_offset = MEM_GetFuncOffset(G1CP_SetCaller2FStackPos);
        str_id = MEM_GetSymbolIndex("G1CP_ReportFuncToSpy.str");
    };

    var int ptr1;
    var int ptr2;
    var int popPos;

    // Create bytes for after the function is called
    if (!doNotIndent) { // Not possible if the function was called by the engine
        ptr2 = MEM_Alloc(25);
        MEMINT_OverrideFunc_Ptr = ptr2;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, namePtr);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    mem_readstring_offset);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, -1);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    indent_offset);
        MEMINT_OFTokPar(zPAR_TOK_JUMP,    ret);
        popPos = ptr2 - MEM_Parser.stack_stack;
    };

    // Inject bytes before the function is called
    ptr1 = MEM_Alloc(61);
    MEMINT_OverrideFunc_Ptr = ptr1;
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT,     channel);
    MEMINT_OFTokPar(zPAR_TOK_PUSHVAR,     str_id);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT,     namePtr);
    MEMINT_OFTokPar(zPAR_TOK_CALL,        mem_readstring_offset);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN,  concatstrings_id);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN,  printdebug_ch_id);
    if (!doNotIndent) { // Do not indent if the end of the function cannot be intercepted to un-indent
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, namePtr);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    mem_readstring_offset);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    indent_offset);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, popPos);
        MEMINT_OFTokPar(zPAR_TOK_CALL,    set_caller_2fr_offset);
    };
    MEMINT_OFTok(zPAR_TOK_RET);
    popPos = ptr1 - MEM_Parser.stack_stack;
    // Replace the call to here
    MEM_WriteInt(posStart+MEM_Parser.stack_stack-4, popPos);

    // Finally, jump before the call to this very function to execute the just overwritten bytes and continue there
    MEM_SetCallerStackPos(posStart-5);
};
