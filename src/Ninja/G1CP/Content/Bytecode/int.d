/*
 * Find any integer assignments. The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindAssignInt(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int needle) {
    var int array; array = MEM_ArrayCreate();

    if (!G1CP_IsInt(assignedSymb)) {
        return array;
    };
    var int arrIdx; arrIdx = G1CP_DecomposeArraySymbolName(_@s(assignedSymb));

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

    MEM_ArrayFree(matches);
    return array;
};

/*
 * Replace any integer assignments with another integer. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignInt(
    var int funcIdOrStartAddr,
    var int zeroOrEndAddr,
    var string assignedSymb,
    var int needle,
    var int replace
) {
    var int matches; matches = G1CP_FindAssignInt(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, needle);

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Overwrite the integer assignment with the replacement integer
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, replace);
        count += 1;
    end;

    MEM_Free(matches);
    return count;
};

/*
 * Replace any integer assignments with another integer (by its symbol ID). The function returns the number of
 * replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignIntId(
    var int funcIdOrStartAddr,
    var int zeroOrEndAddr,
    var string assignedSymb,
    var int needle,
    var int replaceId
) {
    if (!G1CP_IsIntI(replaceId, 0)) {
        return 0;
    };
    var int replace; replace = G1CP_GetIntI(replaceId, 0, 0);
    return G1CP_ReplaceAssignInt(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, needle, replace);
};

/*
 * Find all references of an integer variable/constant excluding assignments, i.e. when it is read but not written.
 * The return value is an array containing the (start) addresses in memory of all matches.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_FindIntRef(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string refSymbol) {
    var int array; array = MEM_ArrayCreate();

    if (!G1CP_IsInt(refSymbol)) {
        return array;
    };
    var int arrIdx; arrIdx = G1CP_DecomposeArraySymbolName(_@s(refSymbol));

    // Check for integer assignments
    var int matches;
    const int bytes[3] = {-1, -1, -1};
    if (arrIdx <= 0) {
        bytes[0] = zPAR_TOK_PUSHVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(refSymbol);
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 5, 0);
    } else {
        bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(refSymbol);
        bytes[2] = arrIdx;
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 6, 0);
    };

    // Iterate over all matches
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Exclude assignments, i.e. my_sym = 5;
        if (MEM_ReadByte(pos+5) == zPAR_OP_IS) {
            continue;
        };

        // Found match
        MEM_ArrayInsert(array, pos);
    end;

    MEM_ArrayFree(matches);
    return array;
};

/*
 * Replace all references of an integer variable/constant excluding assignments, i.e. when it is read but not written,
 * with the return value of a function call. This allows to (conditionally) replace the read value of an integer symbol.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceIntRef(
    var int funcIdOrStartAddr,
    var int zeroOrEndAddr,
    var string refSymbol,
    var int replaceId
) {
    if (!G1CP_IsFuncI(replaceId,  "")) {
        return 0;
    };

    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceId));

    // Confirm the the return value type is integer
    if (replaceSymb.offset != zPAR_TYPE_INT >> 12) {
        return 0;
    };

    // Confirm that the number of parameters is zero
    if ((replaceSymb.bitfield & zCPar_Symbol_bitfield_ele) != 0) {
        return 0;
    };

    var int matches; matches = G1CP_FindIntRef(funcIdOrStartAddr, zeroOrEndAddr, refSymbol);

    // Overwrite each occurrence
    repeat(i, MEM_ArraySize(matches)); var int i;
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
