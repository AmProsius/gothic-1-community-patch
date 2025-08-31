/*
 * Check if function symbol exists and return the address of the symbol.
 * The string parameter "signature" defines the expected function signature. If empty, it will not be checked.
 * The string consists of symbol type names separated by "|". The first part is the return type of the function. The
 * following parts are the individual function parameter types. Types are
 *  - "void" (only for return type)
 *  - "float"
 *  - "int"
 *  - "string"
 *  - "func" (only as parameter type)
 *  - "inst" for any kind of instance
 *  - "none" for no parameters
 * If left blank it serves as a wildcard and is not considered.
 *
 * Example:
 *
 * The function: func int funcName(var int a1, var C_Npc a2) will match with
 *  - ""                No specification on the signature = only check if it's a function
 *  - "int"             Only match the return type of the function against "int"
 *  - "int|int|inst"    Match the function signature exactly
 *  - "int||"           Match the return type and the number of parameters
 *  - "|int|"           Skip matching the return type and the last parameter but match the first parameter
 * The following strings do not match
 *  - "int|"            Too few parameters
 *  - "int|int|inst|"   Too many parameters
 *
 */
func int G1CP_CheckFuncSymbol(var int symbPtr, var string signature, var int isExternal) {
    // Check if symbol exists
    if (!symbPtr) {
        return 0;
    };

    // Check if function
    var zCPar_Symbol symb; symb = _^(symbPtr);
    if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_FUNC) || (!(symb.bitfield & zPAR_FLAG_CONST)) {
        return 0;
    };

    // Check if non-external
    var int isFlgExt; isFlgExt = (symb.bitfield & zPAR_FLAG_EXTERNAL);
    if ((isExternal ==  1) && (!isFlgExt))   // Should be an external but is NOT
    || ((isExternal == -1) &&  (isFlgExt)) { // Should NOT be an external but is
        return 0;
    };

    // Parse signature string
    if (!Hlp_StrCmp(signature, "")) {
        // Split at "|"
        var int t;
        var int numParts; numParts = STR_SplitCount(signature, "|");
        var string retType; retType = STR_Split(signature, "|", 0);
        var int numParam; numParam = numParts - 1;

        // Check return type
        if (!Hlp_StrCmp(retType, "")) { // Skip wildcard
            t = -1;
            if (Hlp_StrCmp(retType, "void")) {
                t = zPAR_TYPE_VOID;
            } else if (Hlp_StrCmp(retType, "float")) {
                t = zPAR_TYPE_FLOAT;
            } else if (Hlp_StrCmp(retType, "int")) {
                t = zPAR_TYPE_INT;
            } else if (Hlp_StrCmp(retType, "string")) {
                t = zPAR_TYPE_STRING;
            } else if (Hlp_StrCmp(retType, "inst")) {
                t = zPAR_TYPE_INSTANCE;
            };
            if ((symb.offset << 12) != t) {
                return 0;
            };
        };

        // Check parameters
        if (numParam > 0) {
            // Check if explicitly specified to have no parameters
            if (Hlp_StrCmp(STR_Split(signature, "|", 1), "none")) {
                numParam = 0;
            };

            // Check number of parameters
            if ((symb.bitfield & zCPar_Symbol_bitfield_ele) != numParam) {
                return 0;
            };

            // Check if parameter symbols would be in valid range
            var int funcId; funcId = MEM_GetSymbolIndex(symb.name);
            if (funcId + numParam >= MEM_Parser.symtab_table_numInArray) {
                return 0;
            };

            // Check parameter types
            repeat(i, numParam); var int i;
                var string parType; parType = STR_Split(signature, "|", i+1);
                if (Hlp_StrCmp(parType, "")) {
                    continue; // Skip wildcard
                };

                var zCPar_Symbol symbPar; symbPar = _^(MEM_GetSymbolByIndex(funcId+1+i));
                t = (symbPar.bitfield & zCPar_Symbol_bitfield_type);
                if (Hlp_StrCmp(parType, "float")) {
                    if (t != zPAR_TYPE_FLOAT) {
                        return 0;
                    };
                } else if (Hlp_StrCmp(parType, "int")) {
                    if (t != zPAR_TYPE_INT) {
                        return 0;
                    };
                } else if (Hlp_StrCmp(parType, "string")) {
                    if (t != zPAR_TYPE_STRING) {
                        return 0;
                    };
                } else if (Hlp_StrCmp(parType, "func")) {
                    if (t != zPAR_TYPE_FUNC) {
                        return 0;
                    };
                } else if (Hlp_StrCmp(parType, "inst")) {
                    if (t != zPAR_TYPE_INSTANCE) {
                        return 0;
                    };
                } else {
                    return 0;
                };
            end;
        };
    };

    // Success
    return symbPtr;
};


/*
 * Check if function symbol exists. For signature see function above.
 */
func int G1CP_IsFuncSymbI(var int symbId, var string signature, var int isExternal) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return (G1CP_CheckFuncSymbol(MEM_GetSymbolByIndex(symbId), signature, isExternal) != 0);
};
func int G1CP_IsFuncSymb(var string name, var string signature, var int isExternal) {
    return (G1CP_CheckFuncSymbol(MEM_GetSymbol(name), signature, isExternal) != 0);
};


/*
 * Check if function symbol exists and return its symbol index. For signature see function above.
 */
func int G1CP_GetFuncSymbId(var string name, var string signature, var int isExternal) {
    if (G1CP_CheckFuncSymbol(MEM_GetSymbol(name), signature, isExternal)) {
        return MEM_GetSymbolIndex(name);
    } else {
        return -1;
    };
};


/*
 * Check if any sort of function exists (either Daedalus or external).
 */
func int G1CP_IsFuncI(var int symbId, var string signature) {
    return G1CP_IsFuncSymbI(symbId, signature, 0);
};
func int G1CP_IsFunc(var string name, var string signature) {
    return G1CP_IsFuncSymb(name, signature, 0);
};
func int G1CP_GetFuncId(var string name, var string signature) {
    return G1CP_GetFuncSymbId(name, signature, 0);
};


/*
 * Check if a function argument is valid in a safe way (e.g. when specifying NOFUNC as argument)
 */
func int G1CP_IsValidFunc(var func f) {
    var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(symb-1));

    while(!(symb.bitfield & zPAR_FLAG_CONST));
        symb = _^(MEM_GetSymbolByIndex(symb.content));
        if ((symb.bitfield & zCPar_Symbol_bitfield_type) != zPAR_TYPE_FUNC) || (symb.content == -1)  {
            return FALSE;
        };
    end;

    return TRUE;
};
