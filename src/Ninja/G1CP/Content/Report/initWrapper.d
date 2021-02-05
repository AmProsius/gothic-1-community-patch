/*
 * Wrapping function for initializations to record successful and failed fixes
 */

/*
 * This function wraps consecutive function calls to intercept their return value. It is used to create a record of all
 * fixes that were applied/not applied without overloading the init functions with if-conditions on every function call.
 */
func int Ninja_G1CP_InitWrapper(var int pos, var int endParam, var int revert) {
    // Hijack the caller function: We wrap around any function calls the caller function makes and then jump back
    var int tok; tok = MEM_ReadByte(pos); pos += 1;
    var int param; param = MEM_ReadInt(pos); pos += 4;
    var int so; so = SB_Get();
    var int s; s = SB_New();

    Ninja_G1CP_zSpyIndent("G1CP-init", 1);

    while((tok == zPAR_TOK_CALL) && (param != endParam));
        // Get function that's called next
        var int funcId; funcId = MEM_GetFuncIDByOffset(param);

        // Some initial checks on the function and its name
        if (funcId > 0) && (funcId < currSymbolTableLength) {
            var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
            if (STR_StartsWith(symb.name, "NINJA_G1CP_")) {
                var int id;     // Issue number
                var int namePtr; namePtr = STR_ToChar(symb.name)+11;

                // Check if it is a fix initialization function (leading digits)
                var int chr; chr = MEM_ReadByte(namePtr);
                if (47 < chr) && (chr < 58) {
                    id = STR_ToInt(STR_SubStr(symb.name, 11, 3));
                } else {
                    id = 0;
                };

                // Issue number
                if (id) {
                    SB(Ninja_G1CP_LFill(ConcatStrings("#", IntToString(id)), " ", 4));
                    SB(" ");
                } else {
                    SB("     ");
                };

                // Function name
                SB(STR_FromChar(namePtr + 4*(id>0)));

                // Call the function
                Ninja_G1CP_zSpyIndent(symb.name, 3);
                MEM_CallByOffset(param);
                Ninja_G1CP_zSpyIndent(symb.name, -3);

                // Make sure to re-active the string builder
                SB_Use(s);

                // Check return type
                var int status; status = zERR_TYPE_INFO;
                if (symb.offset) {
                    var int success; success = MEM_PopIntResult();
                    var int prevStatus; prevStatus = _HT_Get(Ninja_G1CP_FixTable, id);

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
                    status = (revert << 2) | (prevStatus << 1) | success;
                    SB(Ninja_G1CP_LFill("", " ", 42-SB_Length()));
                    SB(MEM_ReadStatStringArr(STATTEXT, status));

                    // Update fix table
                    if (id) {
                        var int newState; newState = (status && status < 4) || (status == 6);
                        _HT_InsertOrChange(Ninja_G1CP_FixTable, newState, id);
                    };

                    // Set message color
                    status = ((!status) || (status == 6)) + 2; // zERR_TYPE_WARN or zERR_TYPE_FAULT
                };

                // Print to zSpy
                MEM_SendToSpy(status, SB_ToString());

                // Clear the string
                SB_Clear();
            } else {
                MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings("  Skipping illegal function call to ", symb.name));
            };
        } else {
            MEM_SendToSpy(zERR_TYPE_FAULT, ConcatStrings("  Skipping call to unknown function ", IntToString(param)));
        };

        // Advance to next instruction
        tok =  MEM_ReadByte(pos); pos += 1;
        param = MEM_ReadInt(pos); pos += 4;
    end;

    // Destroy and restore previous string builder
    SB_Destroy();
    SB_Use(so);

    Ninja_G1CP_zSpyIndent("G1CP-init", -1);

    // Return the position after the last executed function
    return pos-5;
};


/*
 * Record the initialization process and record any failures
 */
func int Ninja_G1CP_InitStart() {
    // Here is where Ikarus is initialized the very first time
    MEM_InitAll();

    // Do slow function ID/offset retrieval only the first time
    const int sessioninit   = 0;
    const int gameinit      = 0;
    const int gamerevert    = 0;
    const int initEndOffset = 0;
    if (!sessioninit) {
        sessioninit   = MEM_GetFuncID(Ninja_G1CP_Menu);
        gameinit      = MEM_GetFuncID(Ninja_G1CP_GamesaveFixes_Apply);
        gamerevert    = MEM_GetFuncID(Ninja_G1CP_GamesaveFixes_Revert);
        initEndOffset = MEM_GetFuncOffset(Ninja_G1CP_InitEnd);
    };

    // Hello? Who dis? jk, I gots your caller-ID!
    var int posStart; posStart = MEM_GetCallerStackPos();
    var int callerId; callerId = MEM_GetFuncIDByOffset(posStart);
    var int pos; pos = posStart + currParserStackAddress;
    var string action; var int revert;
    if (callerId == sessioninit) {
        action = "Initializing ";
        revert = FALSE;

        // Do not call session initialization again (overwrite the condition in 'Ninja_G1CP_Menu' to FALSE)
        MEM_WriteByte(pos-5, zPAR_TOK_PUSHINT);
        MEM_WriteInt(pos-4,  FALSE);

        // Confirm the instructions that will happen after this function returns
        if (MEM_ReadByte(pos) != zPAR_TOK_JUMPF) {
            var string c; c = MEM_ReadStatStringArr(PARSER_TOKEN_NAMES, MEM_ReadByte(pos));
            MEM_SendToSpy(zERR_TYPE_FATAL, ConcatStrings("Assertion failed: Ninja_G1CP_Menu is malformatted: ", c));
            return FALSE;
        };
        pos += 5;

        // Run first time initialization
        Ninja_G1CP_InitOnce();

    } else if (callerId == gameinit) {
        action = "Initializing ";
        revert = FALSE;
    } else if (callerId == gamerevert) {
        action = "Reverting ";
        revert = TRUE;
    } else {
        MEM_SendToSpy(zERR_TYPE_FATAL, "Ninja_G1CP_GameSaveInit_Start was called in wrong context");
        return FALSE;
    };

    // Setup hash table
    if (!Ninja_G1CP_FixTable) {
        Ninja_G1CP_FixTable = _HT_Create();
    };

    // Mark the start
    action = ConcatStrings(action, Ninja_G1CP_GetVersionString(TRUE, FALSE, FALSE));
    MEM_Info("");
    MEM_Info(action);

    // Wrap all function calls
    pos = Ninja_G1CP_InitWrapper(pos, initEndOffset, revert);

    // Integrity check
    if (MEM_ReadInt(pos+1) != initEndOffset) {
        MEM_SendToSpy(zERR_TYPE_FATAL, "Assertion failed: Ninja_G1CP_GameSaveInit_End expected");
        return FALSE;
    };

    // Jump beyond all the function calls to Ninja_G1CP_InitEnd
    MEM_PushStringParam(action);
    MEM_SetCallerStackPos(pos-currParserStackAddress);
};
func void Ninja_G1CP_InitEnd() {
    // Mark the end
    MEM_Info(ConcatStrings(MEM_PopStringResult(), " complete"));
    MEM_Info("");
};
