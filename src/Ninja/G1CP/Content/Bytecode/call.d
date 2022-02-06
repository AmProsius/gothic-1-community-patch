/*
 * Find any function calls. The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindCall(var int funcIdOrStartAddr, var int zeroOrEndAddr, var int needleId) {
    // Create array from the start
    var int array; array = MEM_ArrayCreate();

    // Needle can only be a function, because instance functions cannot be called from a function directly
    if (!G1CP_IsFuncI(needleId,  "")) {
        return array;
    };

    // Decide if Daedalus or external function
    var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(needleId));
    const int bytes[2] = {-1, -1};
    if (needleSymb.bitfield & zPAR_FLAG_EXTERNAL) {
        bytes[0] = zPAR_TOK_CALLEXTERN << 24;
        bytes[1] = needleId;
    } else {
        bytes[0] = zPAR_TOK_CALL << 24;
        bytes[1] = needleSymb.content;
    };

    // Find function calls
    array = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 5, 0);
    return array;
};

/*
 * Replace any function calls with a call to another. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceCall(var int funcIdOrStartAddr, var int zeroOrEndAddr, var int needleId, var int replaceId) {
    // Needle and replace can only be functions, because instance functions cannot be called from a function directly
    if (!G1CP_IsFuncI(needleId,  ""))
    || (!G1CP_IsFuncI(replaceId, "")) {
        return 0;
    };

    var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(needleId));
    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceId));

    // Confirm matching return value type
    if (needleSymb.offset != replaceSymb.offset) {
        return 0;
    };

    // Confirm matching number of parameters
    var int pNum; pNum = (needleSymb.bitfield & zCPar_Symbol_bitfield_ele);
    if (pNum != (replaceSymb.bitfield & zCPar_Symbol_bitfield_ele)) {
        return 0;
    };
    if (needleId+pNum >= MEM_Parser.symtab_table_numInArray) || (replaceId+pNum >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };

    // Confirm matching parameter types
    var zCPar_Symbol pSymb;
    repeat(i, pNum); var int i;
        pSymb = _^(MEM_GetSymbolByIndex(needleId+1+i));
        var int t0; t0 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);
        pSymb = _^(MEM_GetSymbolByIndex(replaceId+1+i));
        var int t1; t1 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);

        // Strings and instances are special, anything else is just pushed as integer
        if ((t0 == zPAR_TYPE_STRING)   && (t1 != zPAR_TYPE_STRING))
        || ((t0 != zPAR_TYPE_STRING)   && (t1 == zPAR_TYPE_STRING))
        || ((t0 == zPAR_TYPE_INSTANCE) && (t1 != zPAR_TYPE_INSTANCE))
        || ((t0 != zPAR_TYPE_INSTANCE) && (t1 == zPAR_TYPE_INSTANCE)) {
            return 0;
        };
    end;

    // Find function calls
    var int matches; matches = G1CP_FindCall(funcIdOrStartAddr, zeroOrEndAddr, needleId);

    // Overwrite each occurrence
    repeat(i, MEM_ArraySize(matches));
        MEMINT_OverrideFunc_Ptr = MEM_ArrayRead(matches, i);
        if (replaceSymb.bitfield & zPAR_FLAG_EXTERNAL) {
            MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, replaceId);
        } else {
            MEMINT_OFTokPar(zPAR_TOK_CALL, replaceSymb.content);
        };
    end;

    // Free the array and return
    var int count; count = MEM_ArraySize(matches);
    MEM_Free(matches);
    return count;
};
