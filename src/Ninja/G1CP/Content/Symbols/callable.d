/*
 * Check if symbol is any sort of function (including instance functions and prototypes), aka. "executable".
 */
func int G1CP_CheckCallableSymbol(var int symbPtr) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Only allow non-external functions, prototypes and constant instances (instance functions)
    var zCPar_Symbol symb; symb = _^(symbPtr);
    var int type; type = symb.bitfield & zCPar_Symbol_bitfield_type;
    if ((symb.bitfield & zPAR_FLAG_CONST) && (!(symb.bitfield & zPAR_FLAG_EXTERNAL))
    &&  ((type == zPAR_TYPE_FUNC) || (type == zPAR_TYPE_INSTANCE)))
    ||  (type == zPAR_TYPE_PROTOTYPE) { // Not constant
        return symbPtr;
    };

    return 0;
};


/*
 * Check if executable symbol exists.
 */
func int G1CP_IsCallableP(var int symbPtr) {
    return (G1CP_CheckCallableSymbol(symbPtr) != 0);
};
func int G1CP_IsCallableI(var int symbId) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_IsCallableP(MEM_GetSymbolByIndex(symbId));
};
func int G1CP_IsCallable(var string name) {
    return G1CP_IsCallableP(MEM_GetSymbol(name));
};


/*
 * Check if executable symbol exists and return its stack offset.
 */
func int G1CP_GetCallableOffsetP(var int symbPtr) {
    if (G1CP_CheckCallableSymbol(symbPtr)) {
        return MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
    } else {
        return -1; // 0 is start of stack!
    };
};
func int G1CP_GetCallableOffsetI(var int symbId) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_GetCallableOffsetP(MEM_GetSymbolByIndex(symbId));
};
func int G1CP_GetCallableOffset(var string name) {
    return G1CP_GetCallableOffsetP(MEM_GetSymbol(name));
};


/*
 * Check if executable symbol exists and return the code start address in memory.
 */
func int G1CP_GetCallableStartP(var int symbPtr) {
    if (G1CP_CheckCallableSymbol(symbPtr)) {
        return MEM_ReadInt(symbPtr + zCParSymbol_content_offset) +  MEM_Parser.stack_stack;
    } else {
        return 0;
    };
};
func int G1CP_GetCallableStartI(var int symbId) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return G1CP_GetCallableStartP(MEM_GetSymbolByIndex(symbId));
};
func int G1CP_GetCallableStart(var string name) {
    return G1CP_GetCallableStartP(MEM_GetSymbol(name));
};
