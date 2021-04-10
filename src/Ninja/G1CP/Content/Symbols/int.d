/*
 * Check if string symbol exists and return the address of the symbol. The parameter "ele" specifies the array index
 * (zero is first or none). The parameter "isConst" specifies if it's a integer constant (1) or integer variable (-1).
 * If 0, it will not be checked.
 */
func int G1CP_CheckIntSymbol(var int symbPtr, var int ele, var int isConst) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Check if integer
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_INT) {
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
 * Check if integer symbol exists and return the address to its content.
 */
func int G1CP_GetIntAddrP(var int symbPtr, var int ele, var int isConst) {
    if (!G1CP_CheckIntSymbol(symbPtr, ele, isConst)) {
        return 0;
    };

    // Check if array
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) > 1) {
        return MEM_ReadInt(symb.content + 4 * ele);
    } else {
        return symbPtr + zCParSymbol_content_offset;
    };
};


/*
 * Check if integer symbol exists
 */
func int G1CP_IsIntSymbP(var int symbPtr, var int ele, var int isConst) {
    return (G1CP_CheckIntSymbol(symbPtr, ele, isConst) != 0);
};
func int G1CP_IsIntSymbI(var int symbId, var int ele, var int isConst) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsIntSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst);
};
func int G1CP_IsIntSymb(var string name, var int ele, var int isConst) {
    return G1CP_IsIntSymbP(MEM_GetSymbol(name), ele, isConst);
};


/*
 * Check if integer symbol exists and return its value
 */
func int G1CP_GetIntSymbP(var int symbPtr, var int ele, var int isConst, var int dflt) {
    var int ptr; ptr = G1CP_GetIntAddrP(symbPtr, ele, isConst);
    if (ptr) {
        return MEM_ReadInt(ptr);
    } else {
        return dflt;
    };
};
func int G1CP_GetIntSymbI(var int symbId, var int ele, var int isConst, var int dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    return G1CP_GetIntSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst, dflt);
};
func int G1CP_GetIntSymb(var string name, var int ele, var int isConst, var int dflt) {
    return G1CP_GetIntSymbP(MEM_GetSymbol(name), ele, isConst, dflt);
};


/*
 * Check if integer symbol exists and set its value
 */
func void G1CP_SetIntSymbP(var int symbPtr, var int ele, var int isConst, var int value) {
    var int ptr; ptr = G1CP_GetIntAddrP(symbPtr, ele, isConst);
    if (ptr) {
        MEM_WriteInt(ptr, value);
    };
};
func void G1CP_SetIntSymbI(var int symbId, var int ele, var int isConst, var int value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    G1CP_SetIntSymbP(MEM_GetSymbolByIndex(symbId), ele, isConst, value);
};
func void G1CP_SetIntSymb(var string name, var int ele, var int isConst, var int value) {
    G1CP_SetIntSymbP(MEM_GetSymbol(name), ele, isConst, value);
};


/*
 * Check if any sort of single-element string exists
 */
func int G1CP_IsIntP(var int symbPtr) {
    return G1CP_IsIntSymbP(symbPtr, 0, 0);
};
func int G1CP_IsIntI(var int symbId) {
    return G1CP_IsIntSymbI(symbId, 0, 0);
};
func int G1CP_IsInt(var string name) {
    return G1CP_IsIntSymb(name, 0, 0);
};


/*
 * Check if any sort of single-element string exists and return its value
 */
func int G1CP_GetIntP(var int symbPtr, var int dflt) {
    return G1CP_GetIntSymbP(symbPtr, 0, 0, dflt);
};
func int G1CP_GetIntI(var int symbId, var int dflt) {
    return G1CP_GetIntSymbI(symbId, 0, 0, dflt);
};
func int G1CP_GetInt(var string name, var int dflt) {
    return G1CP_GetIntSymb(name, 0, 0, dflt);
};


/*
 * Check if any sort of single-element string exists and return its value
 */
func void G1CP_SetIntP(var int symbPtr, var int value) {
    G1CP_SetIntSymbP(symbPtr, 0, 0, value);
};
func void G1CP_SetIntI(var int symbId, var int value) {
    G1CP_SetIntSymbI(symbId, 0, 0, value);
};
func void G1CP_SetInt(var string name, var int value) {
    G1CP_SetIntSymb(name, 0, 0, value);
};


/*
 * Check if integer variable exists
 */
func int G1CP_IsIntVarP(var int symbPtr, var int ele) {
    return G1CP_IsIntSymbP(symbPtr, ele, -1);
};
func int G1CP_IsIntVarI(var int symbId, var int ele) {
    return G1CP_IsIntSymbI(symbId, ele, -1);
};
func int G1CP_IsIntVar(var string name, var int ele) {
    return G1CP_IsIntSymb(name, ele, -1);
};


/*
 * Check if integer variable exists and return its value
 */
func int G1CP_GetIntVarP(var int symbPtr, var int ele, var int dflt) {
    return G1CP_GetIntSymbP(symbPtr, ele, -1, dflt);
};
func int G1CP_GetIntVarI(var int symbId, var int ele, var int dflt) {
    return G1CP_GetIntSymbI(symbId, ele, -1, dflt);
};
func int G1CP_GetIntVar(var string name, var int ele, var int dflt) {
    return G1CP_GetIntSymb(name, ele, -1, dflt);
};


/*
 * Check if integer variable exists and set its value
 */
func void G1CP_SetIntVarP(var int symbPtr, var int ele, var int value) {
    G1CP_SetIntSymbP(symbPtr, ele, -1, value);
};
func void G1CP_SetIntVarI(var int symbId, var int ele, var int value) {
    G1CP_SetIntSymbI(symbId, ele, -1, value);
};
func void G1CP_SetIntVar(var string name, var int ele, var int value) {
    G1CP_SetIntSymb(name, ele, -1, value);
};



/*
 * Check if integer constant exists
 */
func int G1CP_IsIntConstP(var int symbPtr, var int ele) {
    return G1CP_IsIntSymbP(symbPtr, ele, 1);
};
func int G1CP_IsIntConstI(var int symbId, var int ele) {
    return G1CP_IsIntSymbI(symbId, ele, 1);
};
func int G1CP_IsIntConst(var string name, var int ele) {
    return G1CP_IsIntSymb(name, ele, 1);
};


/*
 * Check if integer constant exists and return its value
 */
func int G1CP_GetIntConstP(var int symbPtr, var int ele, var int dflt) {
    return G1CP_GetIntSymbP(symbPtr, ele, 1, dflt);
};
func int G1CP_GetIntConstI(var int symbId, var int ele, var int dflt) {
    return G1CP_GetIntSymbI(symbId, ele, 1, dflt);
};
func int G1CP_GetIntConst(var string name, var int ele, var int dflt) {
    return G1CP_GetIntSymb(name, ele, 1, dflt);
};


/*
 * Check if integer constant exists and set its value
 */
func void G1CP_SetIntConstP(var int symbPtr, var int ele, var int value) {
    G1CP_SetIntSymbP(symbPtr, ele, 1, value);
};
func void G1CP_SetIntConstI(var int symbId, var int ele, var int value) {
    G1CP_SetIntSymbI(symbId, ele, 1, value);
};
func void G1CP_SetIntConst(var string name, var int ele, var int value) {
    G1CP_SetIntSymb(name, ele, 1, value);
};
