/*
 * Check if string symbol exists and return the address of the symbol. The parameter "arrIdx" specifies the array index
 * (zero is first or none). The parameter "isConst" specifies if it's a string constant (1) or string variable (-1).
 * If 0, it will not be checked.
 */
func int G1CP_CheckStringSymbol(var int symbPtr, var int arrIdx, var int isConst) {
    // Check if symbol
    if (!symbPtr) {
        return 0;
    };

    // Check if string
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_STRING) {
        return 0;
    };

    // Check if constant
    var int isFlgConst; isFlgConst = (symb.bitfield & zPAR_FLAG_CONST);
    if ((isConst ==  1) && (!isFlgConst))   // Should be a constant but is NOT
    || ((isConst == -1) &&  (isFlgConst)) { // Should NOT be a constant but is
        return 0;
    };

    // Check if enough elements
    if (arrIdx < 0) || ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= arrIdx) {
        return 0;
    };

    // Success
    return symbPtr;
};


/*
 * Check if string symbol exists and return the address to its content.
 */
func int G1CP_GetStringAddr(var int symbPtr, var int arrIdx, var int isConst) {
    if (!G1CP_CheckStringSymbol(symbPtr, arrIdx, isConst)) {
        return 0;
    };

    // Check if string is present (if initialized)
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if (!symb.content) {
        return 0;
    };

    // Check if content is string (paranoid)
    var int addr; addr = symb.content + sizeof_zString * arrIdx;
    if (MEM_ReadInt(addr) != zString__vtbl) {
        return 0;
    };

    // Return address to content
    return addr;
};


/*
 * Check if string symbol exists
 */
func int G1CP_IsStringSymbI(var int symbId, var int arrIdx, var int isConst) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return (G1CP_CheckStringSymbol(MEM_GetSymbolByIndex(symbId), arrIdx, isConst) != 0);
};
func int G1CP_IsStringSymb(var string name, var int arrIdx, var int isConst) {
    return (G1CP_CheckStringSymbol(MEM_GetSymbol(name), arrIdx, isConst) != 0);
};


/*
 * Check if string symbol exists and return its value
 */
func int G1CP_GetStringSymbId(var string name, var int arrIdx, var int isConst) {
    if (G1CP_CheckStringSymbol(MEM_GetSymbol(name), arrIdx, isConst)) {
        return MEM_GetSymbolIndex(name);
    } else {
        return -1;
    };
};


/*
 * Check if string symbol exists and return its value
 */
func string G1CP_GetStringSymbI(var int symbId, var int arrIdx, var int isConst, var string dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbolByIndex(symbId), arrIdx, isConst);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};
func string G1CP_GetStringSymb(var string name, var int arrIdx, var int isConst, var string dflt) {
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};


/*
 * Check if string symbol exists and return its value
 */
func void G1CP_SetStringSymbI(var int symbId, var int arrIdx, var int isConst, var string value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbolByIndex(symbId), arrIdx, isConst);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};
func void G1CP_SetStringSymb(var string name, var int arrIdx, var int isConst, var string value) {
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};


/*
 * Check if any sort of single-element string exists
 */
func int G1CP_IsStringI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, 0);
};
func int G1CP_IsString(var string name, var int arrIdx) {
    return G1CP_IsStringSymb(name, arrIdx, 0);
};
func int G1CP_GetStringId(var string name, var int arrIdx) {
    return G1CP_GetStringSymbId(name, arrIdx, 0);
};
func string G1CP_GetStringI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, 0, dflt);
};
func string G1CP_GetString(var string name, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymb(name, arrIdx, 0, dflt);
};
func void G1CP_SetStringI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, 0, value);
};
func void G1CP_SetString(var string name, var int arrIdx, var string value) {
    G1CP_SetStringSymb(name, arrIdx, 0, value);
};


/*
 * Check if string variable exists
 */
func int G1CP_IsStringVarI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, -1);
};
func int G1CP_IsStringVar(var string name, var int arrIdx) {
    return G1CP_IsStringSymb(name, arrIdx, -1);
};
func int G1CP_GetStringVarId(var string name, var int arrIdx) {
    return G1CP_GetStringSymbId(name, arrIdx, -1);
};
func string G1CP_GetStringVarI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, -1, dflt);
};
func string G1CP_GetStringVar(var string name, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymb(name, arrIdx, -1, dflt);
};
func void G1CP_SetStringVarI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, -1, value);
};
func void G1CP_SetStringVar(var string name, var int arrIdx, var string value) {
    G1CP_SetStringSymb(name, arrIdx, -1, value);
};


/*
 * Check if string constant exists
 */
func int G1CP_IsStringConstI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, 1);
};
func int G1CP_IsStringConst(var string name, var int arrIdx) {
    return G1CP_IsStringSymb(name, arrIdx, 1);
};
func int G1CP_GetStringConstId(var string name, var int arrIdx) {
    return G1CP_GetStringSymbId(name, arrIdx, 1);
};
func string G1CP_GetStringConstI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, 1, dflt);
};
func string G1CP_GetStringConst(var string name, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymb(name, arrIdx, 1, dflt);
};
func void G1CP_SetStringConstI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, 1, value);
};
func void G1CP_SetStringConst(var string name, var int arrIdx, var string value) {
    G1CP_SetStringSymb(name, arrIdx, 1, value);
};


/*
 * Find a string in a constant string array (case-sensitive) and return its array index
 */
func int G1CP_FindStringConstArrIdxI(var int symbId, var string needle) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return -1;
    };

    // Find the string constant symbol
    var int symbPtr; symbPtr = G1CP_CheckStringSymbol(MEM_GetSymbolByIndex(symbId), 0, TRUE);
    if (!symbPtr) {
        return -1;
    };

    // Search the strings in the array and return the first match if any
    var zCPar_Symbol symb; symb = _^(symbPtr);
    repeat(arrIdx, symb.bitfield & zCPar_Symbol_bitfield_ele); var int arrIdx;
        var int addr; addr = symb.content + sizeof_zString * arrIdx;

        // Paranoid
        if (MEM_ReadInt(addr) != zString__vtbl) {
            continue;
        };

        // Check for match (case-sensitive!)
        if (STR_Compare(MEM_ReadString(addr), needle) == STR_EQUAL) {
            return arrIdx;
        };
    end;

    // Not found
    return -1;
};
func int G1CP_FindStringConstArrIdx(var string name, var string needle) {
    return G1CP_FindStringConstArrIdxI(MEM_GetSymbolIndex(name), needle);
};

/*
 * Replace element in string array constant
 */
func int G1CP_ConstReplaceStr(var string strConst, var string originalStr, var string correctedStr) {
    var int idx; idx = G1CP_FindStringConstArrIdx(strConst, originalStr);

    if (idx == -1) {
        return FALSE;
    }

    G1CP_SetStringConst(strConst, idx, correctedStr);
    return TRUE;
};
