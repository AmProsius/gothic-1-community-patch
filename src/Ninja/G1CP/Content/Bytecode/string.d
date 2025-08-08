/*
 * Find any string assignments. The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindAssignStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int arrIdx,
                            var string needle) {
    var int array; array = MEM_ArrayCreate();

    // Check for assignment or only pushed string
    var int matches;
    var int offset;
    if (Hlp_StrCmp(assignedSymb, "")) {
        // Only check for pushed strings
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(zPAR_TOK_PUSHVAR), 1, 0);
        offset = 0;
    } else {
        // Check for string assignments
        if (!G1CP_IsString(assignedSymb, arrIdx)) {
            return array;
        };
        const int bytes[3] = {-1, -1, -1};
        if (arrIdx <= 0) {
            bytes[0] = zPAR_TOK_PUSHVAR<<24;
            bytes[1] = MEM_GetSymbolIndex(assignedSymb);
            bytes[2] = zPAR_TOK_ASSIGNSTR;
            matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 6, 0);
        } else {
            bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
            bytes[1] = MEM_GetSymbolIndex(assignedSymb);
            bytes[2] = arrIdx + (zPAR_TOK_ASSIGNSTR<<8);
            matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 7, 0);
        };
        offset = 5;
    };

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i) - offset;

        // Check the pushed string content against "needle"
        if (MEM_ReadByte(pos) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos+1);
            if (STR_Compare(G1CP_GetStringI(varId, 0, "G1CP invalid string"), needle) == STR_EQUAL) {
                MEM_ArrayInsert(array, pos);
            };
        };
    end;

    MEM_ArrayFree(matches);

    return array;
};

/*
 * Find any pushed strings. The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindPushStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string needle) {
    return G1CP_FindAssignStr(funcIdOrStartAddr, zeroOrEndAddr, "", 0, needle);
};

/*
 * Replace any string assignments with another string (by its symbol ID). The function returns the number of
 * replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignStrId(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb,
                                 var int arrIdx, var string needle, var int replaceId) {
    // Must be a constant
    if (!G1CP_IsStringConstI(replaceId, 0)) {
        return 0;
    };

    var int matches; matches = G1CP_FindAssignStr(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, arrIdx, needle);

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Overwrite the string assignment with the replacement string
        MEMINT_OverrideFunc_Ptr = pos;
        MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, replaceId);
        count += 1;
    end;

    MEM_Free(matches);

    return count;
};

/*
 * Replace any string assignments with another string. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb,
                               var int arrIdx, var string needle, var string replace) {
    // Find the non-variable, unique source of the replacement string
    var int replaceId; replaceId = G1CP_GetStringSourceId(replace);
    return G1CP_ReplaceAssignStrId(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, arrIdx, needle, replaceId);
};

/*
 * Replace any pushed strings with another string (by its symbol ID). The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplacePushStrId(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string needle, var int replaceId) {
    return G1CP_ReplaceAssignStrId(funcIdOrStartAddr, zeroOrEndAddr, "", 0, needle, replaceId);
};

/*
 * Replace any pushed strings with another string. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplacePushStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string needle, var string replace) {
    // Find the non-variable, unique source of the replacement string
    var int replaceId; replaceId = G1CP_GetStringSourceId(replace);
    return G1CP_ReplaceAssignStrId(funcIdOrStartAddr, zeroOrEndAddr, "", 0, needle, replaceId);
};
