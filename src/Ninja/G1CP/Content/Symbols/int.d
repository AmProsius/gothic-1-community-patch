/*
 * Check if integer symbol exists and return the pointer to its content
 */
func int G1CP_GetIntVarPtrBySymbol(var int symbPtr, var int ele) {
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
 * Check if integer symbol exists and return its value
 */
func int G1CP_GetIntVarBySymbol(var int symbPtr, var int ele, var int dflt) {
    var int ptr; ptr = G1CP_GetIntVarPtrBySymbol(symbPtr, ele);
    if (ptr) {
        return MEM_ReadInt(ptr);
    } else {
        return dflt;
    };
};
func int G1CP_GetIntVarByIndex(var int symbId, var int ele, var int dflt) {
    if (symbId < 0) || (symbId >= currSymbolTableLength) {
        return dflt;
    };
    return G1CP_GetIntVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, dflt);
};
func int G1CP_GetIntVar(var string name, var int ele, var int dflt) {
    return G1CP_GetIntVarBySymbol(MEM_GetSymbol(name), ele, dflt);
};


/*
 * Check if integer symbol exists and set its value
 */
func void G1CP_SetIntVarBySymbol(var int symbPtr, var int ele, var int value) {
    var int ptr; ptr = G1CP_GetIntVarPtrBySymbol(symbPtr, ele);
    if (ptr) {
        MEM_WriteInt(ptr, value);
    };
};
func void G1CP_SetIntVarByIndex(var int symbId, var int ele, var int value) {
    if (symbId < 0) || (symbId >= currSymbolTableLength) {
        return;
    };
    G1CP_SetIntVarBySymbol(MEM_GetSymbolByIndex(symbId), ele, value);
};
func void G1CP_SetIntVar(var string name, var int ele, var int value) {
    G1CP_SetIntVarBySymbol(MEM_GetSymbol(name), ele, value);
};
