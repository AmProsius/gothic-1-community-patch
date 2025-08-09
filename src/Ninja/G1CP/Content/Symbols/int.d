/*
 * Check if string symbol exists and return the address of the symbol. The parameter "arrIdx" specifies the array index
 * (zero is first or none). The parameter "isConst" specifies if it's a integer constant (1) or integer variable (-1).
 * If 0, it will not be checked.
 */
func int G1CP_CheckIntSymbol(var int symbPtr, var int arrIdx, var int isConst) {
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
    if (arrIdx < 0) || ((symb.bitfield & zCPar_Symbol_bitfield_ele) <= arrIdx) {
        return 0;
    };

    // Success
    return symbPtr;
};


/*
 * Check if integer symbol exists and return the address to its content.
 */
func int G1CP_GetIntAddr(var int symbPtr, var int arrIdx, var int isConst) {
    if (!G1CP_CheckIntSymbol(symbPtr, arrIdx, isConst)) {
        return 0;
    };

    // Check if array
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_ele) > 1) {
        return MEM_ReadInt(symb.content + 4 * arrIdx);
    } else {
        return symbPtr + zCParSymbol_content_offset;
    };
};


/*
 * Check if integer symbol exists
 */
func int G1CP_IsIntSymbI(var int symbId, var int arrIdx, var int isConst) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return (G1CP_CheckIntSymbol(MEM_GetSymbolByIndex(symbId), arrIdx, isConst) != 0);
};
func int G1CP_IsIntSymb(var string name, var int arrIdx, var int isConst) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    return (G1CP_CheckIntSymbol(MEM_GetSymbol(name), arrIdx, isConst) != 0);
};


/*
 * Check if integer symbol exists and return its symbol index
 */
func int G1CP_GetIntSymbId(var string name, var int arrIdx, var int isConst) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    if (G1CP_CheckIntSymbol(MEM_GetSymbol(name), arrIdx, isConst)) {
        return MEM_GetSymbolIndex(name);
    } else {
        return -1;
    };
};


/*
 * Check if integer symbol exists and return its value
 */
func int G1CP_GetIntSymbI(var int symbId, var int arrIdx, var int isConst, var int dflt) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return dflt;
    };
    var int ptr; ptr = G1CP_GetIntAddr(MEM_GetSymbolByIndex(symbId), arrIdx, isConst);
    if (ptr) {
        return MEM_ReadInt(ptr);
    } else {
        return dflt;
    };
};
func int G1CP_GetIntSymb(var string name, var int arrIdx, var int isConst, var int dflt) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    var int ptr; ptr = G1CP_GetIntAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        return MEM_ReadInt(ptr);
    } else {
        return dflt;
    };
};


/*
 * Check if integer symbol exists and set its value
 */
func void G1CP_SetIntSymbI(var int symbId, var int arrIdx, var int isConst, var int value) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return;
    };
    var int ptr; ptr = G1CP_GetIntAddr(MEM_GetSymbolByIndex(symbId), arrIdx, isConst);
    if (ptr) {
        MEM_WriteInt(ptr, value);
    };
};
func void G1CP_SetIntSymb(var string name, var int arrIdx, var int isConst, var int value) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    var int ptr; ptr = G1CP_GetIntAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        MEM_WriteInt(ptr, value);
    };
};


/*
 * Check if any sort of single-element string exists
 */
func int G1CP_IsIntI(var int symbId, var int arrIdx) {
    return G1CP_IsIntSymbI(symbId, arrIdx, 0);
};
func int G1CP_IsInt(var string name) {
    return G1CP_IsIntSymb(name, -1, 0);
};
func int G1CP_GetIntId(var string name) {
    return G1CP_GetIntSymbId(name, -1, 0);
};
func int G1CP_GetIntI(var int symbId, var int arrIdx, var int dflt) {
    return G1CP_GetIntSymbI(symbId, arrIdx, 0, dflt);
};
func int G1CP_GetInt(var string name, var int dflt) {
    return G1CP_GetIntSymb(name, -1, 0, dflt);
};
func void G1CP_SetIntI(var int symbId, var int arrIdx, var int value) {
    G1CP_SetIntSymbI(symbId, arrIdx, 0, value);
};
func void G1CP_SetInt(var string name, var int value) {
    G1CP_SetIntSymb(name, -1, 0, value);
};


/*
 * Check if integer variable exists
 */
func int G1CP_IsIntVarI(var int symbId, var int arrIdx) {
    return G1CP_IsIntSymbI(symbId, arrIdx, -1);
};
func int G1CP_IsIntVar(var string name) {
    return G1CP_IsIntSymb(name, -1, -1);
};
func int G1CP_GetIntVarId(var string name) {
    return G1CP_GetIntSymbId(name, -1, -1);
};
func int G1CP_GetIntVarI(var int symbId, var int arrIdx, var int dflt) {
    return G1CP_GetIntSymbI(symbId, arrIdx, -1, dflt);
};
func int G1CP_GetIntVar(var string name, var int dflt) {
    return G1CP_GetIntSymb(name, -1, -1, dflt);
};
func void G1CP_SetIntVarI(var int symbId, var int arrIdx, var int value) {
    G1CP_SetIntSymbI(symbId, arrIdx, -1, value);
};
func void G1CP_SetIntVar(var string name, var int value) {
    G1CP_SetIntSymb(name, -1, -1, value);
};


/*
 * Check if integer constant exists
 */
func int G1CP_IsIntConstI(var int symbId, var int arrIdx) {
    return G1CP_IsIntSymbI(symbId, arrIdx, 1);
};
func int G1CP_IsIntConst(var string name) {
    return G1CP_IsIntSymb(name, -1, 1);
};
func int G1CP_GetIntConstId(var string name) {
    return G1CP_GetIntSymbId(name, -1, 1);
};
func int G1CP_GetIntConstI(var int symbId, var int arrIdx, var int dflt) {
    return G1CP_GetIntSymbI(symbId, arrIdx, 1, dflt);
};
func int G1CP_GetIntConst(var string name, var int dflt) {
    return G1CP_GetIntSymb(name, -1, 1, dflt);
};
func void G1CP_SetIntConstI(var int symbId, var int arrIdx, var int value) {
    G1CP_SetIntSymbI(symbId, arrIdx, 1, value);
};
func void G1CP_SetIntConst(var string name, var int value) {
    G1CP_SetIntSymb(name, -1, 1, value);
};
