/*
 * Check if string symbol exists and return the address of the symbol. The parameter "ele" specifies the array index
 * (zero is first or none). The parameter "isConst" specifies if it's a string constant (1) or string variable (-1).
 * If 0, it will not be checked.
 */
func int G1CP_CheckStringSymbol(var int symbPtr, var int ele, var int isConst) {
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
    if (ele < 0) || ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= ele) {
        return 0;
    };

    // Success
    return symbPtr;
};


/*
 * Check if string symbol exists and return the address to its content.
 */
func int G1CP_GetStringAddrP(var int symbPtr, var int ele, var int isConst) {
    if (!G1CP_CheckStringSymbol(symbPtr, ele, isConst)) {
        return 0;
    };

    // Check if string is present (if initialized)
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if (!symb.content) {
        return 0;
    };

    // Check if content is string (paranoid)
    var int addr; addr = symb.content + sizeof_zString * ele;
    if (MEM_ReadInt(addr) != zString__vtbl) {
        return 0;
    };

    // Return address to content
    return addr;
};


/*
 * Check if string symbol exists
 */
func int G1CP_IsStringSymbP(var int symbPtr, var int ele, var int isConst) {
    return (G1CP_CheckStringSymbol(symbPtr, ele, isConst) != 0);
};
func int G1CP_IsStringSymbI(var int symbId, var int ele, var int isConst) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsStringSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst);
};
func int G1CP_IsStringSymb(var string name, var int ele, var int isConst) {
    return G1CP_IsStringSymbP(MEM_GetSymbol(name), ele, isConst);
};


/*
 * Check if string symbol exists and return its value
 */
func string G1CP_GetStringSymbP(var int symbPtr, var int ele, var int isConst, var string dflt) {
    var int ptr; ptr = G1CP_GetStringAddrP(symbPtr, ele, isConst);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};
func string G1CP_GetStringSymbI(var int symbId, var int ele, var int isConst, var string dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    return G1CP_GetStringSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst, dflt);
};
func string G1CP_GetStringSymb(var string name, var int ele, var int isConst, var string dflt) {
    return G1CP_GetStringSymbP(MEM_GetSymbol(name), ele, isConst, dflt);
};


/*
 * Check if string symbol exists and return its value
 */
func void G1CP_SetStringSymbP(var int symbPtr, var int ele, var int isConst, var string value) {
    var int ptr; ptr = G1CP_GetStringAddrP(symbPtr, ele, isConst);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};
func void G1CP_SetStringSymbI(var int symbId, var int ele, var int isConst, var string value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    G1CP_SetStringSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst, value);
};
func void G1CP_SetStringSymb(var string name, var int ele, var int isConst, var string value) {
    G1CP_SetStringSymbP(MEM_GetSymbol(name), ele, isConst, value);
};


/*
 * Check if any sort of single-element string exists
 */
func int G1CP_IsStringP(var int symbPtr) {
    return G1CP_IsStringSymbP(symbPtr, 0, 0);
};
func int G1CP_IsStringI(var int symbId) {
    return G1CP_IsStringSymbI(symbId, 0, 0);
};
func int G1CP_IsString(var string name) {
    return G1CP_IsStringSymb(name, 0, 0);
};


/*
 * Check if any sort of single-element string exists and return its value
 */
func string G1CP_GetStringP(var int symbPtr, var string dflt) {
    return G1CP_GetStringSymbP(symbPtr, 0, 0, dflt);
};
func string G1CP_GetStringI(var int symbId, var string dflt) {
    return G1CP_GetStringSymbI(symbId, 0, 0, dflt);
};
func string G1CP_GetString(var string name, var string dflt) {
    return G1CP_GetStringSymb(name, 0, 0, dflt);
};


/*
 * Check if any sort of single-element string exists and return its value
 */
func void G1CP_SetStringP(var int symbPtr, var string value) {
    G1CP_SetStringSymbP(symbPtr, 0, 0, value);
};
func void G1CP_SetStringI(var int symbId, var string value) {
    G1CP_SetStringSymbI(symbId, 0, 0, value);
};
func void G1CP_SetString(var string name, var string value) {
    G1CP_SetStringSymb(name, 0, 0, value);
};


/*
 * Check if string variable exists
 */
func int G1CP_IsStringVarP(var int symbPtr, var int ele) {
    return G1CP_IsStringSymbP(symbPtr, ele, -1);
};
func int G1CP_IsStringVarI(var int symbId, var int ele) {
    return G1CP_IsStringSymbI(symbId, ele, -1);
};
func int G1CP_IsStringVar(var string name, var int ele) {
    return G1CP_IsStringSymb(name, ele, -1);
};


/*
 * Check if string variable exists and return its value
 */
func string G1CP_GetStringVarP(var int symbPtr, var int ele, var string dflt) {
    return G1CP_GetStringSymbP(symbPtr, ele, -1, dflt);
};
func string G1CP_GetStringVarI(var int symbId, var int ele, var string dflt) {
    return G1CP_GetStringSymbI(symbId, ele, -1, dflt);
};
func string G1CP_GetStringVar(var string name, var int ele, var string dflt) {
    return G1CP_GetStringSymb(name, ele, -1, dflt);
};


/*
 * Check if string variable exists and return its value
 */
func void G1CP_SetStringVarP(var int symbPtr, var int ele, var string value) {
    G1CP_SetStringSymbP(symbPtr, ele, -1, value);
};
func void G1CP_SetStringVarI(var int symbId, var int ele, var string value) {
    G1CP_SetStringSymbI(symbId, ele, -1, value);
};
func void G1CP_SetStringVar(var string name, var int ele, var string value) {
    G1CP_SetStringSymb(name, ele, -1, value);
};


/*
 * Check if string constant exists
 */
func int G1CP_IsStringConstP(var int symbPtr, var int ele) {
    return G1CP_IsStringSymbP(symbPtr, ele, 1);
};
func int G1CP_IsStringConstI(var int symbId, var int ele) {
    return G1CP_IsStringSymbI(symbId, ele, 1);
};
func int G1CP_IsStringConst(var string name, var int ele) {
    return G1CP_IsStringSymb(name, ele, 1);
};


/*
 * Check if string constant exists and return its value
 */
func string G1CP_GetStringConstP(var int symbPtr, var int ele, var string dflt) {
    return G1CP_GetStringSymbP(symbPtr, ele, 1, dflt);
};
func string G1CP_GetStringConstI(var int symbId, var int ele, var string dflt) {
    return G1CP_GetStringSymbI(symbId, ele, 1, dflt);
};
func string G1CP_GetStringConst(var string name, var int ele, var string dflt) {
    return G1CP_GetStringSymb(name, ele, 1, dflt);
};


/*
 * Check if string constant exists and return its value
 */
func void G1CP_SetStringConstP(var int symbPtr, var int ele, var string value) {
    G1CP_SetStringSymbP(symbPtr, ele, 1, value);
};
func void G1CP_SetStringConstI(var int symbId, var int ele, var string value) {
    G1CP_SetStringSymbI(symbId, ele, 1, value);
};
func void G1CP_SetStringConst(var string name, var int ele, var string value) {
    G1CP_SetStringSymb(name, ele, 1, value);
};
