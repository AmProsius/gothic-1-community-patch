/*
 * Find matching byte code in a function (multiple times)
 * Comparison happens starting from each token. Any search needs to start with a token byte (e.g. zPAR_TOK_PUSHVAR)
 */
func int Ninja_G1CP_FindInFunc(var int funcId, var int needle, var int byteCount) {
    // Make sure all exist
    if (funcId < 0) || (funcId >= currSymbolTableLength)
    || (!needle) {
        return 0;
    };

    // Tokenize function to get the token onsets and the end of the function
    var int positions; positions = MEM_ArrayCreate();
    var int dump; dump = MEM_ArrayCreate();
    MEMINT_TokenizeFunction(funcId, dump, dump, positions);
    MEM_ArrayFree(dump);
    var int funcEnd; funcEnd = MEM_ArrayLast(positions);

    // Create array to collect all matches
    var int all; all = MEM_ArrayCreate();

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
func int Ninja_G1CP_ReplaceCallInFunc(var int funcId, var int needleCallId, var int replaceCallId) {
    // Make sure all exist
    if (funcId < 0)        || (funcId >= currSymbolTableLength)
    || (needleCallId < 0)  || (needleCallId >= currSymbolTableLength)
    || (replaceCallId < 0) || (replaceCallId >= currSymbolTableLength) {
        return 0;
    };

    // More thorough check of needle and replacement
    var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(needleCallId));
    var int type; type = (needleSymb.bitfield & zCPar_Symbol_bitfield_type);
    if (type != zPAR_TYPE_FUNC) && (type != zPAR_TYPE_PROTOTYPE) && (type != zPAR_TYPE_INSTANCE) {
       return 0;
    };
    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceCallId));
    type = (replaceSymb.bitfield & zCPar_Symbol_bitfield_type);
    if (type != zPAR_TYPE_FUNC) && (type != zPAR_TYPE_PROTOTYPE) && (type != zPAR_TYPE_INSTANCE) {
       return 0;
    };

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
    var int matches; matches = Ninja_G1CP_FindInFunc(funcId, _@(word)+3, 5);

    // Safety first
    if (!matches) {
        return 0;
    };

    // Overwrite each occurrence
    repeat(i, MEM_ArraySize(matches)); var int i;
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
