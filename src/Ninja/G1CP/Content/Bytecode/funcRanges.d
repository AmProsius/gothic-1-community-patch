/*
 * Array holding the symbol indices of all valid functions
 */
const int G1CP_FuncIds = 0; // zCArray*

/*
 * Create array of function indices. It should be quite fast now.
 */
func int G1CP_CollectFuncIDs() {
    // Only do once
    if (G1CP_FuncIds) {
        return TRUE;
    };

    // Collect the symbol indices of all functions, prototypes and instance functions (assembly for performance)
    G1CP_FuncIds = MEM_ArrayCreate();
    const int zCPar_SymbolTable__GetNumInList = 7318128; //0x6FAA70
    const int zCPar_SymbolTable__GetSymbol    = 7316496; //0x6FA410
    const int zCPar_Symbol__HasFlag           = 7308416; //0x6F8480
    const int zCArray_int__InsertEnd          = 5439504; //0x530010
    ASM_Open(116+1);
    ASM_1(96);                                                         // pusha
    ASM_1(190);   ASM_4(ContentParserAddress);                         // mov    esi, ContentParserAddress
    ASM_3(1076877);                                                    // lea    ebp, [esi+0x10]
    ASM_2(56113);                                                      // xor    ebx, ebx
    ASM_1(75);                                                         // dec    ebx
    // loopStart:
    ASM_1(67);                                                         // inc    ebx
    ASM_2(59785);                                                      // mov    ecx, ebp
    ASM_1(232);   ASM_4(zCPar_SymbolTable__GetNumInList-ASM_Here()-4); // call   zCPar_SymbolTable::GetNumInList
    ASM_2(49977);                                                      // cmp    ebx, eax
    ASM_2(23165);                                                      // jge    loopEnd
    ASM_1(83);                                                         // push   ebx
    ASM_2(59785);                                                      // mov    ecx, ebp
    ASM_1(232);   ASM_4(zCPar_SymbolTable__GetSymbol-ASM_Here()-4);    // call   zCPar_SymbolTable::GetSymbol
    ASM_2(49285);                                                      // test   eax, eax
    ASM_2(59508);                                                      // jz     loopStart
    ASM_2(49801);                                                      // mov    edx, eax
    ASM_3(2116235);                                                    // mov    ecx, [edx+0x20]
    ASM_2(57729); ASM_4(61440);                                        // and    ecx, 0xf000
    ASM_2(63873); ASM_4(24576);                                        // cmp    ecx, 0x6000   ; prototype
    ASM_2(10868);                                                      // jz     add
    ASM_2(63873); ASM_4(28672);                                        // cmp    ecx, 0x7000   ; instance
    ASM_2(2164);                                                       // jz     checkFlags
    ASM_2(63873); ASM_4(20480);                                        // cmp    ecx, 0x5000   ; function
    ASM_2(50549);                                                      // jnz    loopStart
    // checkFlags:
    ASM_2(362);                                                        // push   0x1           ; const
    ASM_2(53641);                                                      // mov    ecx, edx
    ASM_1(232);   ASM_4(zCPar_Symbol__HasFlag-ASM_Here()-4);           // call   zCPar_Symbol::HasFlag
    ASM_2(49285);                                                      // test   eax, eax
    ASM_2(47220);                                                      // jz     loopStart
    ASM_2(2154);                                                       // push   0x8           ; external
    ASM_2(53641);                                                      // mov    ecx, edx
    ASM_1(232);   ASM_4(zCPar_Symbol__HasFlag-ASM_Here()-4);           // call   zCPar_Symbol::HasFlag
    ASM_2(49285);                                                      // test   eax, eax
    ASM_2(43893);                                                      // jnz    loopStart
    // add:
    ASM_1(83);                                                         // push   ebx
    ASM_1(84);                                                         // push   esp
    ASM_1(185);   ASM_4(G1CP_FuncIds);                                 // mov    ecx, G1CP_FuncIds
    ASM_1(232);   ASM_4(zCArray_int__InsertEnd-ASM_Here()-4);          // call   zCArray<int>::InsertEnd
    ASM_3(312451);                                                     // add    esp, 0x4
    ASM_2(39659);                                                      // jmp    loopStart
    // loopEnd:
    ASM_1(97);                                                         // popa
    ASM_1(195);                                                        // ret
    ASM_RunOnce();

    // Done
    return TRUE;
};

/*
 * Retrieve the position in the function ID array given a function ID. If the given symbol index is not a valid function
 * return -1.
 */
func int G1CP_GetFuncIDArrPos(var int funcId) {
    // It's not even a binary search, but still faster than a Daedalus hash table
    const int zCArray__Search = 6151392; //0x5DDCE0
    const int funcIdPtr = 0;
    const int call = 0;
    if (CALL_Begin(call)) {
        funcIdPtr = _@(funcId);
        CALL_IntParam(_@(funcIdPtr));
        CALL_PutRetValTo(_@(ret));
        CALL__thiscall(_@(G1CP_FuncIds), zCArray__Search);
        call = CALL_End();
    };

    var int ret;
    return +ret;
};


/*
 * Retrieve function bytecode start address. If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncStart(var int funcId) {
    // Avoid checking if it's a valid function, by simply checking the function ID
    if (G1CP_GetFuncIDArrPos(funcId) == -1) {
        return FALSE;
    };

    // Return the function's offset (start in byte code)
    return MEM_ReadInt(MEM_GetSymbolByIndex(funcId) + zCParSymbol_content_offset) + MEM_Parser.stack_stack;
};

/*
 * Retrieve function bytecode end address (i.e. address of last byte). If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncEnd(var int funcId) {
    // Find the next function after that one
    var int nextPos; nextPos = G1CP_GetFuncIDArrPos(funcId) + 1;
    if (!nextPos) {
        return FALSE;
    };

    // And return its starting address
    if (MEM_ArraySize(G1CP_FuncIds) > nextPos) {
        var int symbPtr; symbPtr = MEM_GetSymbolByIndex(MEM_ArrayRead(G1CP_FuncIds, nextPos));
        return MEM_ReadInt(symbPtr + zCParSymbol_content_offset) + MEM_Parser.stack_stack - 1;
    } else {
        return MEM_Parser.stack_stacklast-1;
    };
};
