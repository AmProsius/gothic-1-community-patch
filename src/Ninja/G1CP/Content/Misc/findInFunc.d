/*
 * Find matching byte code in a function (multiple times)
 * Comparison happens starting from each token. Any search needs to start with a token byte (e.g. zPAR_TOK_PUSHVAR)
 */
func int G1CP_FindInFunc(var int funcId, var int needle, var int byteCount) {
    // Create array to collect all matches (even if exiting prematurely, to always provide an array as return value)
    var int all; all = MEM_ArrayCreate();

    // Make sure all exist
    if (funcId < 0) || (funcId >= currSymbolTableLength)
    || (!needle) {
        return all;
    };

    // Additional check on the symbol type (MEMINT_TokenizeFunction does not check that)
    var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
    var int type; type = (symb.bitfield & zCPar_Symbol_bitfield_type);
    if (type != zPAR_TYPE_FUNC) && (type != zPAR_TYPE_PROTOTYPE) && (type != zPAR_TYPE_INSTANCE) {
       return all;
    };

    // Tokenize function to get the token onsets and the end of the function
    var int positions; positions = MEM_ArrayCreate();
    var int dump; dump = MEM_ArrayCreate();
    MEMINT_TokenizeFunction(funcId, dump, dump, positions);
    MEM_ArrayFree(dump);
    var int funcEnd; funcEnd = MEM_ArrayLast(positions);

    // Iterate over and compare the bytes of the function
    repeat(i, MEM_ArraySize(positions)); var int i;
        var int pos; pos = MEM_ArrayRead(positions, i);
        if (pos > funcEnd-byteCount) {
            break;
        };
        if (MEM_CompareBytes(pos, needle, byteCount)) {
            MEM_ArrayInsert(all, pos);
        };
    end;

    // Free array
    MEM_ArrayFree(positions);

    return all;
};

/*
 * Replace any function calls within a function with a call to another
 * The function returns the number of replacements
 */
func int G1CP_ReplaceCall(var int funcId, var int needleCallId, var int replaceCallId) {
    // Make sure all exist
    if (funcId < 0)        || (funcId >= currSymbolTableLength)
    || (needleCallId < 0)  || (needleCallId >= currSymbolTableLength)
    || (replaceCallId < 0) || (replaceCallId >= currSymbolTableLength) {
        return 0;
    };

    // Needle and replace can only be functions, because instance functions cannot be called from a function directly
    var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(needleCallId));
    var int type; type = (needleSymb.bitfield & zCPar_Symbol_bitfield_type);
    if (type != zPAR_TYPE_FUNC) {
       return 0;
    };
    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceCallId));
    if (type != (replaceSymb.bitfield & zCPar_Symbol_bitfield_type)) {
        return 0;
    };

    // Confirm matching return value type
    if (needleSymb.offset != replaceSymb.offset) {
        return 0;
    };

    // Confirm matching number of parameters
    var int pNum; pNum = (needleSymb.bitfield & zCPar_Symbol_bitfield_ele);
    if (pNum != (replaceSymb.bitfield & zCPar_Symbol_bitfield_ele)) {
        return 0;
    };
    if (needleCallId+pNum >= currSymbolTableLength) || (replaceCallId+pNum >= currSymbolTableLength) {
        return 0;
    };

    // Confirm matching parameter types
    var zCPar_Symbol pSymb;
    repeat(i, pNum); var int i;
        pSymb = _^(MEM_GetSymbolByIndex(needleCallId+1+i));
        var int t0; t0 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);
        pSymb = _^(MEM_GetSymbolByIndex(replaceCallId+1+i));
        var int t1; t1 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);

        // Strings and instances are special, anything else is just pushed as integer
        if ((t0 == zPAR_TYPE_STRING)   && (t1 != zPAR_TYPE_STRING))
        || ((t0 != zPAR_TYPE_STRING)   && (t1 == zPAR_TYPE_STRING))
        || ((t0 == zPAR_TYPE_INSTANCE) && (t1 != zPAR_TYPE_INSTANCE))
        || ((t0 != zPAR_TYPE_INSTANCE) && (t1 == zPAR_TYPE_INSTANCE)) {
            return 0;
        };
    end;

    // Decide if Daedalus or external function
    const int word[2] = {0, 0};
    if (needleSymb.bitfield & zPAR_FLAG_EXTERNAL) {
        word[0] = zPAR_TOK_CALLEXTERN << 24;
        word[1] = needleCallId;
    } else {
        word[0] = zPAR_TOK_CALL << 24;
        word[1] = needleSymb.content;
    };

    // Find function calls
    var int matches; matches = G1CP_FindInFunc(funcId, _@(word)+3, 5);

    // Overwrite each occurrence
    repeat(i, MEM_ArraySize(matches));
        MEMINT_OverrideFunc_Ptr = MEM_ArrayRead(matches, i);
        if (replaceSymb.bitfield & zPAR_FLAG_EXTERNAL) {
            MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, replaceCallId);
        } else {
            MEMINT_OFTokPar(zPAR_TOK_CALL, replaceSymb.content);
        };
    end;

    // Free the array and return
    var int count; count = MEM_ArraySize(matches);
    MEM_Free(matches);
    return count;
};

/*
 * Replace any string assignments within a function with another string (by its symbol ID)
 * The function returns the number of replacements
 */
func int G1CP_ReplaceAssignStrID(var int funcId, var string assignedSymb, var int ele, var string needle,
                                       var int replaceId) {
    // Make sure all exist
    if (funcId < 0)    || (funcId >= currSymbolTableLength)
    || (replaceId < 0) || (replaceId >= currSymbolTableLength) {
        return 0;
    };

    // Confirm replacement symbol is a string constant
    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceId));
    if ((replaceSymb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_STRING)
    || (!((replaceSymb.bitfield & zCPar_Symbol_bitfield_flags) & zPAR_FLAG_CONST)) {
        MEM_SendToSpy(zERR_TYPE_FAULT, "G1CP_ReplaceAssignStrID: Argument 'replaceId' has to be a string constant");
        return 0;
    };

    // The needle cannot be an empty string
    if (Hlp_StrCmp(needle, "")) {
        return 0;
    };

    // Check for assignment or only pushed string
    var int matches;
    var int offset;
    if (Hlp_StrCmp(assignedSymb, "")) {
        // Only check for pushed strings
        matches = G1CP_FindInFunc(funcId, _@(zPAR_TOK_PUSHVAR), 1);
        offset = 1;
    } else {
        // Check for string assignments
        var int destSymbId; destSymbId = MEM_FindParserSymbol(assignedSymb);
        if (destSymbId == -1) {
            return 0;
        };
        const int bytes[3] = {-1, -1, -1};
        if (ele <= 0) {
            bytes[0] = zPAR_TOK_PUSHVAR<<24;
            bytes[1] = destSymbId;
            bytes[2] = zPAR_TOK_ASSIGNSTR;
            matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 6);
        } else {
            bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
            bytes[1] = destSymbId;
            bytes[2] = ele + (zPAR_TOK_ASSIGNSTR<<8);
            matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 7);
        };
        offset = 5;
    };

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check the pushed string content against "needle"
        if (MEM_ReadByte(pos-offset) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-offset+1);
            if (Hlp_StrCmp(G1CP_GetStringVarByIndex(varId, 0, ""), needle)) {

                // Overwrite the string assignment with the replacement string
                MEMINT_OverrideFunc_Ptr = pos-offset;
                MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, replaceId);
                count += 1;
            };
        };
    end;

    // Free the array
    MEM_Free(matches);

    return count;
};

/*
 * Replace any string assignments within a function with another string
 * The function returns the number of replacements
 */
func int G1CP_ReplaceAssignStr(var int funcId, var string assignedSymb, var int ele, var string needle,
                                     var string replace) {
    // Obtain the symbol index of the replacement string
    var int calledFrom; calledFrom = MEM_GetCallerStackPos()-5+currParserStackAddress;
    if (MEM_ReadByte(calledFrom)   != zPAR_TOK_CALL)
    || (MEM_ReadInt(calledFrom+1)  != MEM_GetFuncOffset(G1CP_ReplaceAssignStr))
    || (MEM_ReadByte(calledFrom-5) != zPAR_TOK_PUSHVAR) {
        MEM_SendToSpy(zERR_TYPE_FAULT, "G1CP_ReplaceAssignStr called from invalid context");
        return 0;
    };
    var int replaceId; replaceId = MEM_ReadInt(calledFrom-4);

    // Pass on
    return G1CP_ReplaceAssignStrID(funcId, assignedSymb, ele, needle, replaceId);
};

/*
 * Replace any pushed strings within a function with another string (by its symbol ID)
 * The function returns the number of replacements
 */
func int G1CP_ReplacePushStrID(var int funcId, var string needle, var int replaceId) {
    // Pass on
    return G1CP_ReplaceAssignStrID(funcId, "", 0, needle, replaceId);
};

/*
 * Replace any pushed strings within a function with another string
 * The function returns the number of replacements
 */
func int G1CP_ReplacePushStr(var int funcId, var string needle, var string replace) {
    // Obtain the symbol index of the replacement string
    var int calledFrom; calledFrom = MEM_GetCallerStackPos()-5+currParserStackAddress;
    if (MEM_ReadByte(calledFrom)   != zPAR_TOK_CALL)
    || (MEM_ReadInt(calledFrom+1)  != MEM_GetFuncOffset(G1CP_ReplacePushStr))
    || (MEM_ReadByte(calledFrom-5) != zPAR_TOK_PUSHVAR) {
        MEM_SendToSpy(zERR_TYPE_FAULT, "G1CP_ReplacePushStr called from invalid context");
        return 0;
    };
    var int replaceId; replaceId = MEM_ReadInt(calledFrom-4);

    // Pass on
    return G1CP_ReplaceAssignStrID(funcId, "", 0, needle, replaceId);
};
