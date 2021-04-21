/*
 * Find any integer assignments. The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindAssignInt(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int arrIdx,
                            var int needle) {
    // Create array from the start
    var int array; array = MEM_ArrayCreate();

    // Make sure all exist
    if (!G1CP_IsInt(assignedSymb, arrIdx)) {
        return array;
    };

    // Check for integer assignments
    var int matches;
    const int bytes[3] = {-1, -1, -1};
    if (arrIdx <= 0) {
        bytes[0] = zPAR_TOK_PUSHVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(assignedSymb);
        bytes[2] = zPAR_OP_IS;
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 6, 0);
    } else {
        bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(assignedSymb);
        bytes[2] = arrIdx + (zPAR_OP_IS<<8);
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 7, 0);
    };

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check the pushed integer (variable) content against "needle"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (G1CP_GetIntI(varId, 0, -needle) != needle) {
                continue;
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            var int par; par = MEM_ReadInt(pos-4);
            if (par != needle) {
                continue;
            };
        };

        // Found match
        MEM_ArrayInsert(array, pos);
    end;

    // Free the array
    MEM_ArrayFree(matches);

    // Return the matches
    return array;
};

/*
 * Replace any integer assignments with another integer. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignInt(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb,
                               var int arrIdx, var int needle, var int replace) {
    // Make sure all exist
    if (!G1CP_IsInt(assignedSymb, arrIdx)) {
        return 0;
    };

    // Find all string assignments
    var int matches; matches = G1CP_FindAssignInt(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, arrIdx, needle);

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Overwrite the integer assignment with the replacement integer
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, replace);
        count += 1;
    end;

    // Free the array
    MEM_Free(matches);

    return count;
};

/*
 * Replace any integer assignments with another integer (by its symbol ID). The function returns the number of
 * replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignIntId(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb,
                                 var int arrIdx, var int needle, var int replaceId) {
    // Make sure all exist
    if (!G1CP_IsIntI(replaceId, 0)) {
        return 0;
    };
    var int replace; replace = G1CP_GetIntI(replaceId, 0, 0);
    return G1CP_ReplaceAssignInt(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, arrIdx, needle, replace);
};
