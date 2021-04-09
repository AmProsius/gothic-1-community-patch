/*
 * Check if string symbol exists and return the pointer to its content
 */
func int G1CP_GetStringVarPtrBySymbol(var int symbPtr, var int ele) {
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

    // Return pointer to content
    return addr;
};


/*
 * Check if string symbol exists and return its value
 */
func string G1CP_GetStringVarBySymbol(var int symbPtr, var int ele, var string dflt) {
    var int ptr; ptr = G1CP_GetStringVarPtrBySymbol(symbPtr, ele);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};
func string G1CP_GetStringVarByIndex(var int symbId, var int ele, var string dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    return G1CP_GetStringVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func string G1CP_GetStringVar(var string name, var int ele, var string dflt) {
    return G1CP_GetStringVarBySymbol(MEM_GetSymbol(name), ele, dflt);
};


/*
 * Check if string symbol exists and return its value
 */
func void G1CP_SetStringVarBySymbol(var int symbPtr, var int ele, var string value) {
    var int ptr; ptr = G1CP_GetStringVarPtrBySymbol(symbPtr, ele);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};
func void G1CP_SetStringVarByIndex(var int symbId, var int ele, var string value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    G1CP_SetStringVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, value);
};
func void G1CP_SetStringVar(var string name, var int ele, var string value) {
    G1CP_SetStringVarBySymbol(MEM_GetSymbol(name), ele, value);
};
