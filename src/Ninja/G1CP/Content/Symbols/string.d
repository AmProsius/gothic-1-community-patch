/*
 * Check if string symbol exists and return the address to its content
 */
func int G1CP_GetStringAddrP(var int symbPtr, var int ele) {
    // Check if symbol
    if (!symbPtr) {
        return 0;
    };

    // Check if string
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_STRING)  {
        return 0;
    };

    // Check if enough elements
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= ele) {
        return 0;
    };

    // Check if string is present (should never happen)
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
func int G1CP_IsStringVarP(var int symbPtr, var int ele) {
    return (G1CP_GetStringAddrP(symbPtr, ele) != 0);
};
func int G1CP_IsStringVarI(var int symbId, var int ele) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsStringVarP(MEM_GetSymbolByIndex(symbId), ele);
};
func int G1CP_IsStringVar(var string name, var int ele) {
    return G1CP_IsStringVarP(MEM_GetSymbol(name), ele);
};


/*
 * Check if string symbol exists and return its value
 */
func string G1CP_GetStringVarP(var int symbPtr, var int ele, var string dflt) {
    var int ptr; ptr = G1CP_GetStringAddrP(symbPtr, ele);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};
func string G1CP_GetStringVarI(var int symbId, var int ele, var string dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    return G1CP_GetStringVarP(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func string G1CP_GetStringVar(var string name, var int ele, var string dflt) {
    return G1CP_GetStringVarP(MEM_GetSymbol(name), ele, dflt);
};


/*
 * Check if string symbol exists and return its value
 */
func void G1CP_SetStringVarP(var int symbPtr, var int ele, var string value) {
    var int ptr; ptr = G1CP_GetStringAddrP(symbPtr, ele);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};
func void G1CP_SetStringVarI(var int symbId, var int ele, var string value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    G1CP_SetStringVarP(MEM_GetSymbolByIndex(symbId), ele, value);
};
func void G1CP_SetStringVar(var string name, var int ele, var string value) {
    G1CP_SetStringVarP(MEM_GetSymbol(name), ele, value);
};
