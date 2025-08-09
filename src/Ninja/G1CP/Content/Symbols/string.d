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
 * Check if string symbol exists.
 */
func int G1CP_IsStringSymbI(var int symbId, var int arrIdx, var int isConst) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };
    return (G1CP_CheckStringSymbol(MEM_GetSymbolByIndex(symbId), arrIdx, isConst) != 0);
};
func int G1CP_IsStringSymb(var string name, var int arrIdx, var int isConst) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    return (G1CP_CheckStringSymbol(MEM_GetSymbol(name), arrIdx, isConst) != 0);
};


/*
 * Check if string symbol exists and return its symbol index.
 */
func int G1CP_GetStringSymbId(var string name, var int arrIdx, var int isConst) {
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    if (G1CP_CheckStringSymbol(MEM_GetSymbol(name), arrIdx, isConst)) {
        return MEM_GetSymbolIndex(name);
    } else {
        return -1;
    };
};


/*
 * Check if string symbol exists and return its value, otherwise return a default.
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
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        return MEM_ReadString(ptr);
    } else {
        return dflt;
    };
};


/*
 * Check if string symbol exists and set its value. Does not provide feedback if successful!
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
    if (arrIdx <= 0) {
        arrIdx = G1CP_DecomposeArraySymbolName(_@s(name));
    };
    var int ptr; ptr = G1CP_GetStringAddr(MEM_GetSymbol(name), arrIdx, isConst);
    if (ptr) {
        MEM_WriteString(ptr, value);
    };
};


/*
 * Check if any sort (variable or constant) of single-element string exists.
 */
func int G1CP_IsStringI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, 0);
};
func int G1CP_IsString(var string name) {
    return G1CP_IsStringSymb(name, -1, 0);
};
func int G1CP_GetStringId(var string name) {
    return G1CP_GetStringSymbId(name, -1, 0);
};
func string G1CP_GetStringI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, 0, dflt);
};
func string G1CP_GetString(var string name, var string dflt) {
    return G1CP_GetStringSymb(name, -1, 0, dflt);
};
func void G1CP_SetStringI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, 0, value);
};
func void G1CP_SetString(var string name, var string value) {
    G1CP_SetStringSymb(name, -1, 0, value);
};


/*
 * Check if string variable exists.
 */
func int G1CP_IsStringVarI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, -1);
};
func int G1CP_IsStringVar(var string name) {
    return G1CP_IsStringSymb(name, -1, -1);
};
func int G1CP_GetStringVarId(var string name) {
    return G1CP_GetStringSymbId(name, -1, -1);
};
func string G1CP_GetStringVarI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, -1, dflt);
};
func string G1CP_GetStringVar(var string name, var string dflt) {
    return G1CP_GetStringSymb(name, -1, -1, dflt);
};
func void G1CP_SetStringVarI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, -1, value);
};
func void G1CP_SetStringVar(var string name, var string value) {
    G1CP_SetStringSymb(name, -1, -1, value);
};


/*
 * Check if string constant exists.
 */
func int G1CP_IsStringConstI(var int symbId, var int arrIdx) {
    return G1CP_IsStringSymbI(symbId, arrIdx, 1);
};
func int G1CP_IsStringConst(var string name) {
    return G1CP_IsStringSymb(name, -1, 1);
};
func int G1CP_GetStringConstId(var string name) {
    return G1CP_GetStringSymbId(name, -1, 1);
};
func string G1CP_GetStringConstI(var int symbId, var int arrIdx, var string dflt) {
    return G1CP_GetStringSymbI(symbId, arrIdx, 1, dflt);
};
func string G1CP_GetStringConst(var string name, var string dflt) {
    return G1CP_GetStringSymb(name, -1, 1, dflt);
};
func void G1CP_SetStringConstI(var int symbId, var int arrIdx, var string value) {
    G1CP_SetStringSymbI(symbId, arrIdx, 1, value);
};
func void G1CP_SetStringConst(var string name, var string value) {
    G1CP_SetStringSymb(name, -1, 1, value);
};


/*
 * Find a string in a constant string array (case-sensitive) and return its array index.
 */
func int G1CP_FindStringConstArrIdxI(var int symbId, var string needle) {
    if (symbId < 0) || (symbId >= MEM_Parser.symtab_table_numInArray) {
        return -1;
    };

    // Find the string constant symbol
    var int symbPtr; symbPtr = G1CP_CheckStringSymbol(MEM_GetSymbolByIndex(symbId), 0, 1);
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
 * Find a constant string (case-sensitive) and replace it if found. Returns true on success.
 */
func int G1CP_ReplaceStringConst(var string name, var string needle, var string replace) {
    if (STR_Compare(G1CP_GetStringConst(name, "G1CP invalid string"), needle) != STR_EQUAL) {
        return FALSE;
    };

    G1CP_SetStringConst(name, replace);
    return TRUE;
};

/*
 * Find a string in a constant string array (case-sensitive) and replace it if found. Returns true on success.
 */
func int G1CP_ReplaceStringConstArrElem(var string name, var string needle, var string replace) {
    var int idx; idx = G1CP_FindStringConstArrIdx(name, needle);

    if (idx == -1) {
        return FALSE;
    };

    G1CP_SetStringSymb(name, idx, 1, replace); // No shorthand function available

    return TRUE;
};


/*
 * Find all constants that reference the exact char address of an arbitrary string and return their symbol IDs.
 *
 * Every string literal in Daedalus (e.g. "hello world"), whether assigned to a variable or passed to a function, is
 * first defined as its own parser symbol, specifically a string constant, under the hood. Although the string is copied
 * when handed around, its char is not duplicated. That allows this function to find all constants that reference the
 * exact char by its address.
 *
 * This function is not very useful by itself, see G1CP_FindUniqueSourceStringSymbId for a practical function.
 */
func int G1CP_GetAllStringSourceIds(var string needle) {
    var int array; array = MEM_ArrayCreate();

    // Iterate over symbol table (in machine code for performance)
    const int code = 0;
    if (!code) {
        const int zCArray_int__InsertEnd = 5439504; //0x530010
        const int zCPar_SymbolTable__cur_table = 9298292; //0x8DE174

        const int zCPar_SymbolTable_table_array_offset = 8; //0x8
        const int zCPar_SymbolTable_table_numInArray_offset = 16; //0x10
        const int zCParSymbol_bitfield_offset = 32; //0x20
        const int sizeof_zCPar_Symbol_Ptr = 4; //0x4
        const int zString_char_offset = 8; //0x8

        const int mask = zCPar_Symbol_bitfield_type | zCPar_Symbol_bitfield_flags;
        const int value = zPAR_TYPE_STRING | zPAR_FLAG_CONST;
        const int charAddrPtr = 0; charAddrPtr = _@s(needle) + zString_char_offset;

        ASM_Open(80+1);
        ASM_1(96);                                                      // pusha
        ASM_2(51505);                                                   // xor    ecx,ecx
        // loopStart:
        ASM_1(161);   ASM_4(zCPar_SymbolTable__cur_table);              // mov    eax,zCPar_SymbolTable__cur_table
        ASM_2(20619); ASM_1(zCPar_SymbolTable_table_numInArray_offset); // mov    edx,[eax+0x10]
        ASM_2(53561);                                                   // cmp    ecx,edx
        ASM_2(626);                                                     // jb     cont
        ASM_1(97);                                                      // popa
        ASM_1(195);                                                     // ret
        // cont:
        ASM_2(28811); ASM_1(zCPar_SymbolTable_table_array_offset);      // mov    esi,[eax+0x8]
        ASM_1(139);   ASM_1(sizeof_zCPar_Symbol_Ptr);   ASM_1(142);     // mov    eax,[esi+ecx*0x4]
        ASM_2(49285);                                                   // test   eax,eax
        ASM_2(12916);                                                   // je     loopAdvance
        ASM_2(30859); ASM_1(zCParSymbol_bitfield_offset);               // mov    edi,[eax+0x20]
        ASM_2(59265); ASM_4(mask);                                      // and    edi,0x3ff000
        ASM_2(65409); ASM_4(value);                                     // cmp    edi,0x13000
        ASM_2(8565);                                                    // jne    loopAdvance
        ASM_2(30859); ASM_1(zCParSymbol_content_offset);                // mov    edi,[eax+0x18]
        ASM_2(65413);                                                   // test   edi,edi
        ASM_2(6772);                                                    // je     loopAdvance
        ASM_2(32651); ASM_1(zString_char_offset);                       // mov    edi,[edi+0x8]
        ASM_1(161);   ASM_4(charAddrPtr);                               // mov    eax,[charAddrPtr]
        ASM_2(51001);                                                   // cmp    edi,eax
        ASM_2(3701);                                                    // jne    loopAdvance
        ASM_1(81);                                                      // push   ecx
        ASM_1(84);                                                      // push   esp
        ASM_2(3467);  ASM_4(_@(array));                                 // mov    ecx,[array]
        ASM_1(232);   ASM_4(zCArray_int__InsertEnd-ASM_Here()-4);       // call   zCArray<int>::InsertEnd
        ASM_1(89);                                                      // pop    ecx
        // loopAdvance:
        ASM_1(65);                                                      // inc    ecx
        ASM_2(46059);                                                   // jmp    loopStart
        code = ASM_Close();
    };
    ASM_Run(code);

    return array;
};


/*
 * Find the unique source constant of an arbitrary string and return its symbol ID.
 *
 * The argument "needle" can be a variable, literal, or constant. Its source will be identified. For details see above.
 *
 * If the string was assigned to another constant at run-time or if it is constructed at run-time, e.g. with
 * ConcatStrings("hello", "world"), then this function fails to identify a unique source and will return -1.
 */
func int G1CP_GetStringSourceId(var string needle) {
    var int res; res = -1;
    var int array; array = G1CP_GetAllStringSourceIds(needle);
    if (MEM_ArraySize(array) == 1) {  // Needs to be uniquely identifiable!
        res = MEM_ArrayPop(array);
    };
    MEM_ArrayFree(array);
    return res;
};
