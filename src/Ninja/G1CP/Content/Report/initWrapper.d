/*
 * Wrapping function for initializations to record successful and failed fixes
 */

/*
 * This function wraps consecutive function calls to intercept their return value. It is used to create a record of all
 * fixes that were applied/not applied without overloading the init functions with if-conditions on every function call.
 */
func int G1CP_InitStart() {
    // Here is where Ikarus is initialized the very first time
    MEM_InitAll();

    // Get function offsets and symbol indicies once
    const string indentStr = "G1CP-init";
    const string actionStr = "";
    const string emptyStr = "";
    const string versionStr = "";
    const string initStr = "Initializing ";
    const string revertStr = "Reverting ";
    const int time = 0;
    const int MEM_GetSystemTime_offset = 0;
    const int MEM_Info_offset = 0;
    const int G1CP_GetVersionString_offset = 0;
    const int G1CP_zSpyIndent_offset = 0;
    const int G1CP_InitBuildLine_offset = 0;
    const int G1CP_InitBuildLastLine_offset = 0;
    const int sessioninit_id = -1;
    const int gameinit_id = -1;
    const int gamerevert_id = -1;
    const int ConcatStrings_id = 0;
    const int time_id = -1;
    const int indentStr_id = -1;
    const int actionStr_id = -1;
    const int emptyStr_id = -1;
    const int initStr_id = -1;
    const int revertStr_id = -1;
    const int versionStr_id = -1;
    if (!MEM_GetSystemTime_offset) {
        MEM_GetSystemTime_offset = MEM_GetFuncOffset(MEM_GetSystemTime);
        MEM_Info_offset = MEM_GetFuncOffset(MEM_Info);
        G1CP_GetVersionString_offset = MEM_GetFuncOffset(G1CP_GetVersionString);
        G1CP_zSpyIndent_offset = MEM_GetFuncOffset(G1CP_zSpyIndent);
        G1CP_InitBuildLine_offset = MEM_GetFuncOffset(G1CP_InitBuildLine);
        G1CP_InitBuildLastLine_offset = MEM_GetFuncOffset(G1CP_InitBuildLastLine);
        sessioninit_id = MEM_GetFuncID(Ninja_G1CP_Menu);
        gameinit_id = MEM_GetFuncID(G1CP_GamesaveFixes_Apply);
        gamerevert_id = MEM_GetFuncID(G1CP_GamesaveFixes_Revert);
        ConcatStrings_id = MEM_GetFuncID(ConcatStrings);
        time_id = MEM_GetSymbolIndex("G1CP_InitStart.time");
        indentStr_id = MEM_GetSymbolIndex("G1CP_InitStart.indentStr");
        actionStr_id = MEM_GetSymbolIndex("G1CP_InitStart.actionStr");
        emptyStr_id = MEM_GetSymbolIndex("G1CP_InitStart.emptyStr");
        initStr_id = MEM_GetSymbolIndex("G1CP_InitStart.initStr");
        revertStr_id = MEM_GetSymbolIndex("G1CP_InitStart.revertStr");
        versionStr = G1CP_GetVersionString(TRUE, FALSE, FALSE);
        versionStr_id = MEM_GetSymbolIndex("G1CP_InitStart.versionStr");
    };

    // Hello? Who dis? jk, I gots your caller-ID!
    var int posStart; posStart = MEM_GetCallerStackPos();
    var int callerId; callerId = MEM_GetFuncIDByOffset(posStart);
    posStart += currParserStackAddress;
    var int pos; pos = posStart;
    posStart -= 5;

    // Do pre-initialization
    if (callerId == sessioninit_id) {
        G1CP_InitPre();
    };

    // Confirm caller
    if (callerId != sessioninit_id)
    && (callerId != gameinit_id)
    && (callerId != gamerevert_id) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "G1CP_GameSaveInit_Start was called in wrong context");
        return FALSE;
    };

    // Get caller context
    var int initOnce; initOnce = (callerId == sessioninit_id);
    var int revert;   revert   = (callerId == gamerevert_id);

    // Confirm that the call was made after an 'if'
    var int tok; tok = MEM_ReadByte(pos); pos += 1;
    var int posEnd; posEnd = MEM_ReadInt(pos) + currParserStackAddress; pos += 4;
    if (tok != zPAR_TOK_JUMPF) {
        if (tok < 0) || (tok >= 246) {
            tok = zPAR_TOK_PUSH_ARRAYVAR-1; // "[INVALID_TOKEN]"
        };
        var string c; c = MEM_ReadStatStringArr(PARSER_TOKEN_NAMES, tok);
        c = ConcatStrings("Assertion failed: G1CP_InitStart was called in wrong context. Expected 'if': ", c);
        MEM_SendToSpy(zERR_TYPE_FATAL, c);
        return FALSE;
    };

    // Setup stream
    var int so; so = SB_Get();
    var int s; s = SB_New();

    // Allocate the estimated length of the byte code
    const int bytesBefore  = 11 + 41 + 15;
    const int bytesAfter   = 15 + 15 + 6;
    const int bytesPerCall = 25;
    var int numCalls; numCalls = (posEnd-pos)/5;
    SB_InitBuffer(bytesBefore + bytesPerCall*numCalls + bytesAfter + /*buffer*/15);

    // Measure the time
    SBc(zPAR_TOK_CALL);        SBw(MEM_GetSystemTime_offset);
    SBc(zPAR_TOK_PUSHVAR);     SBw(time_id);
    SBc(zPAR_OP_IS);

    // Mark the start
    SBc(zPAR_TOK_PUSHVAR);     SBw(emptyStr_id);
    SBc(zPAR_TOK_CALL);        SBw(MEM_Info_offset);
    if (revert) {
        SBc(zPAR_TOK_PUSHVAR); SBw(revertStr_id);
    } else {
        SBc(zPAR_TOK_PUSHVAR); SBw(initStr_id);
    };
    SBc(zPAR_TOK_PUSHVAR);     SBw(versionStr_id);
    SBc(zPAR_TOK_CALLEXTERN);  SBw(ConcatStrings_id);
    SBc(zPAR_TOK_PUSHVAR);     SBw(actionStr_id); // Store and repush because needed later again
    SBc(zPAR_TOK_ASSIGNSTR);
    SBc(zPAR_TOK_PUSHVAR);     SBw(actionStr_id);
    SBc(zPAR_TOK_CALL);        SBw(MEM_Info_offset);

    // Indent
    SBc(zPAR_TOK_PUSHVAR);     SBw(indentStr_id);
    SBc(zPAR_TOK_PUSHINT);     SBw(1);
    SBc(zPAR_TOK_CALL);        SBw(G1CP_zSpyIndent_offset);

    // Advance within the function
    tok = MEM_ReadByte(pos); pos += 1;
    var int offset; offset = MEM_ReadInt(pos); pos += 4;

    // Iterate over all following function calls
    while((tok == zPAR_TOK_CALL) && (pos <= posEnd));
        // Get function that's called next
        var int funcId; funcId = MEM_GetFuncIDByOffset(offset);

        // Some initial checks on the function and its name
        if (funcId > 0) && (funcId < currSymbolTableLength) {
            var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
            if (STR_StartsWith(symb.name, "G1CP_"))
            && (STR_Len(symb.name) >= 8)
            && (symb.offset == (zPAR_TYPE_INT>>12)) {
                var int id;
                var int namePtr; namePtr = STR_ToChar(symb.name)+5;

                // Check if it is a fix initialization function (leading digits)
                var int chr; chr = MEM_ReadByte(namePtr) - 48;
                if (0 <= chr) && (chr <= 9) {
                    id = STR_ToInt(STR_SubStr(symb.name, 5, 3));
                    namePtr += 4;
                } else {
                    id = 0;
                };

                // Re-write the function call, wrapped
                SBc(zPAR_TOK_PUSHINT); SBw(revert);
                SBc(zPAR_TOK_PUSHINT); SBw(id);
                SBc(zPAR_TOK_PUSHINT); SBw(namePtr);
                SBc(zPAR_TOK_PUSHINT); SBw(offset);
                SBc(zPAR_TOK_CALL);    SBw(G1CP_InitBuildLine_offset);
            } else {
                MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings("Skipping illegal function call to ", symb.name));
            };
        } else {
            MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings("Skipping call to unknown function ", IntToString(offset)));
        };

        // Advance to next instruction
        tok =   MEM_ReadByte(pos); pos += 1;
        offset = MEM_ReadInt(pos); pos += 4;
    end;

    // Integrity check
    if (pos < posEnd) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "Assertion failed: Could not find end of initialization block");
        return FALSE;
    };

    // Un-indent
    SBc(zPAR_TOK_PUSHVAR); SBw(indentStr_id);
    SBc(zPAR_TOK_PUSHINT); SBw(-1);
    SBc(zPAR_TOK_CALL);    SBw(G1CP_zSpyIndent_offset);

    // Write last line
    SBc(zPAR_TOK_PUSHVAR); SBw(time_id);
    SBc(zPAR_TOK_PUSHVAR); SBw(actionStr_id);
    SBc(zPAR_TOK_CALL);    SBw(G1CP_InitBuildLastLine_offset);

    // Return FALSE
    SBc(zPAR_TOK_PUSHINT); SBw(FALSE);
    SBc(zPAR_TOK_RET);

    // Overwrite the function call to G1CP_InitStart
    MEMINT_OverrideFunc_Ptr = posStart;
    if (!initOnce) {
        MEMINT_OFTokPar(zPAR_TOK_CALL, SB_GetStream() - currParserStackAddress);
    } else {
        // Do not call session initialization again (overwrite the condition in 'Ninja_G1CP_Menu' to FALSE)
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, FALSE);

        // Call it now
        MEM_CallByPtr(SB_GetStream());
        if (MEM_PopIntResult()) { };
        SB_Use(s); // Re-activate!

        // Dispose
        SB_Clear();
    };

    // Release and restore previous string builder
    SB_Release();
    SB_Use(so);

    // Jump back to before this function call to run the new function
    MEM_SetCallerStackPos(posStart - currParserStackAddress);
};


/*
 * Execute the function call, update fix status and report to zSpy
 */
func void G1CP_InitBuildLine(var int revert, var int id, var int namePtr, var int funcOffset) {
    // Setup string builder once
    const int s = 0;
    if (!s) {
        s = SB_New();
    };

    // Retrieve name
    var string name; name = STR_FromChar(namePtr);
    var int prevStatus;
    var int time;
    var int success;

    // Only execute non-disabled fixes
    var int curState; curState = G1CP_GetFixStatus(id);
    var int disabled; disabled = (curState == G1CP_FIX_DISABLED);
    if (disabled) {
        prevStatus = FALSE;
        success = FALSE;
        time = 0;
    } else {
        // Call the function
        G1CP_zSpyIndent(name, 3);
        time = MEM_GetSystemTime();
        MEM_CallByOffset(funcOffset);
        time = MEM_GetSystemTime() - time;
        G1CP_zSpyIndent(name, -3);

        // Return value
        success = !!MEM_PopIntResult();
        prevStatus = (curState == G1CP_FIX_APPLIED);
    };

    // Make sure to re-active the string builder
    SB_Use(s);

    // Issue number
    if (id) {
        SB(G1CP_LFill(ConcatStrings("#", IntToString(id)), " ", 4));
        SB(" ");
    } else {
        SB("     ");
    };

    // Function name
    SB(name);
    SB(G1CP_LFill("", " ", 42-SB_Length()));

    // Status text (bitfield to avoid lengthy if-blocks)
    const string STATTEXT[8] = { // revert previous return -> new state
        "     NOT APPLIED", // 0:     0       0       0          0
        "         APPLIED", // 1:     0       0       1          1
        " ALREADY APPLIED", // 2:     0       1       0          1
        " ALREADY APPLIED", // 3:     0       1       1          1
        "   NOT NECESSARY", // 4:     1       0       0          0
        "   NOT NECESSARY", // 5:     1       0       1          0
        "FAILED TO REVERT", // 6:     1       1       0          1
        "        REVERTED"  // 7:     1       1       1          0
    };

    // Add indicator to message
    var int status; status = (revert << 2) | (prevStatus << 1) | success;
    SB(MEM_ReadStatStringArr(STATTEXT, status));

    // Update fix table
    if (id) && (!disabled) {
        var int newState; newState = ((0 < status) && (status < 4)) || (status == 6);
        _HT_InsertOrChange(G1CP_LookupTable, newState, id);
    };

    // Append duration
    SB(G1CP_LFill(IntToString(time), " ", 6));
    SB(" ms");

    // Print to zSpy
    MEM_SendToSpy(((!status) || (status == 6)) + 2, SB_ToString()); // zERR_TYPE_WARN or zERR_TYPE_FAULT
    SB_Clear();
};


/*
 * Mark the end of the initialization
 */
func void G1CP_InitBuildLastLine(var int time, var string prefix) {
    var string msg; msg = ConcatStrings(prefix, " complete");
    msg = ConcatStrings(msg, G1CP_LFill(IntToString(MEM_GetSystemTime() - time), " ", 62 - STR_Len(msg) + 4));
    msg = ConcatStrings(msg, " ms");
    MEM_Info(msg);
    MEM_Info("");
};
