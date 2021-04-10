/*
 * Check if integer symbol exists and return the address to its content
 */
func int G1CP_GetIntAddrP(var int symbPtr, var int ele) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Check if integer
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_INT)  {
        return 0;
    };

    // Check if enough elements
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= ele) {
        return 0;
    };

    // Check if array
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) > 1) {
        return MEM_ReadInt(symb.content + 4 * ele);
    } else {
        return symbPtr + zCParSymbol_content_offset;
    };
};


/*
 * Check if integer symbol exists
 */
func int G1CP_IsIntVarP(var int symbPtr, var int ele) {
    return (G1CP_GetIntAddrP(symbPtr, ele) != 0);
};
func int G1CP_IsIntVarI(var int symbId, var int ele) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsIntVarP(MEM_GetSymbolByIndex(symbId), ele);
};
func int G1CP_IsIntVar(var string name, var int ele) {
    return G1CP_IsIntVarP(MEM_GetSymbol(name), ele);
};


/*
 * Check if integer symbol exists and return its value
 */
func int G1CP_GetIntVarP(var int symbPtr, var int ele, var int dflt) {
    var int ptr; ptr = G1CP_GetIntAddrP(symbPtr, ele);
    if (ptr) {
        return MEM_ReadInt(ptr);
    } else {
        return dflt;
    };
};
func int G1CP_GetIntVarI(var int symbId, var int ele, var int dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    return G1CP_GetIntVarP(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func int G1CP_GetIntVar(var string name, var int ele, var int dflt) {
    return G1CP_GetIntVarP(MEM_GetSymbol(name), ele, dflt);
};


/*
 * Check if integer symbol exists and set its value
 */
func void G1CP_SetIntVarP(var int symbPtr, var int ele, var int value) {
    var int ptr; ptr = G1CP_GetIntAddrP(symbPtr, ele);
    if (ptr) {
        MEM_WriteInt(ptr, value);
    };
};
func void G1CP_SetIntVarI(var int symbId, var int ele, var int value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    G1CP_SetIntVarP(MEM_GetSymbolByIndex(symbId), ele, value);
};
func void G1CP_SetIntVar(var string name, var int ele, var int value) {
    G1CP_SetIntVarP(MEM_GetSymbol(name), ele, value);
};
