/*
 * Hash tables for function bytecode ranges
 */
const int G1CP_FuncStarts = 0;
const int G1CP_FuncEnds   = 0;
const int G1CP_FuncIds    = 0; // zCArray*

/*
 * Create hash tables for function starts and ends in code stack (as address in memory) indexed by symbol index (once).
 * I tried to speed this up as much as possible. The bottle neck is _HT_Insert. But it should be no longer than 550ms.
 */
func int G1CP_CollectFuncRanges() {
    // Only do once
    if (G1CP_FuncStarts) {
        return TRUE;
    };

    // Collect the symbol indices of all functions, prototypes and instance functions (assembly for performance)
    var int htSize;
    G1CP_FuncIds = MEM_ArrayCreate();
    const int zCPar_SymbolTable__GetNumInList = 7318128; //0x6FAA70
    const int zCPar_SymbolTable__GetSymbol    = 7316496; //0x6FA410
    const int zCPar_Symbol__HasFlag           = 7308416; //0x6F8480
    const int zCArray_int__InsertEnd          = 5439504; //0x530010
    const int zCPrime__NextPrime              = 5889744; //0x59DED0
    ASM_Open(141+1);
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
    ASM_2(63873); ASM_4(24576);                                        // cmp    ecx, 0x6000   ; prootype
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
    ASM_1(185);   ASM_4(G1CP_FuncIds);                                 // mov    ecx, G1CP_FuncIds
    ASM_3(541067);                                                     // mov    eax, [ecx+0x8]
    ASM_3(194753);                                                     // sar    eax, 0x2
    ASM_1(80);                                                         // push   eax
    ASM_1(232);   ASM_4(zCPrime__NextPrime-ASM_Here()-4);              // call   zCPrime::NextPrime
    ASM_3(312451);                                                     // add    esp, 0x4
    ASM_1(163);   ASM_4(_@(htSize));                                   // mov    htSize, eax
    ASM_1(97);                                                         // popa
    ASM_1(195);                                                        // ret
    ASM_RunOnce();

    // Allocate memory for the hash tables accordingly
    var int num; num = MEM_ArraySize(G1CP_FuncIds);
    var int arr; arr = MEM_ReadInt(G1CP_FuncIds);
    G1CP_FuncStarts = _HT_CreatePtr(htSize); // Next highest prime number after num/4
    G1CP_FuncEnds   = _HT_CreatePtr(htSize);

    // Iterate over all symbols for all functions
    var int prevId; prevId = MEM_ArrayLast(G1CP_FuncIds);
    repeat(i, num); var int i;
        var int id; id = MEM_ReadIntArray(arr, i);
        var int symbPtr; symbPtr = MEM_ReadIntArray(MEM_Parser.symtab_table_array, id);
        var int addr; addr = MEM_ReadInt(symbPtr + zCParSymbol_content_offset) + MEM_Parser.stack_stack;

        // Record function bytecode start
        _HT_Insert(G1CP_FuncStarts, addr,     id); // This is slow :(
        _HT_Insert(G1CP_FuncEnds,   addr - 1, prevId);

        // Determine bytecode end from start of the next function
        prevId = id;
    end;

    // The last function ends with the code stack
    _HT_InsertOrChange(G1CP_FuncEnds, MEM_Parser.stack_stacklast-1, prevId);

    // Done
    return TRUE;
};

/*
 * Retrieve function bytecode start address. If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncStart(var int funcId) {
    return _HT_Get(G1CP_FuncStarts, funcId);
};

/*
 * Retrieve function bytecode end address (i.e. address of last byte). If invalid symbol index, it returns zero.
 */
func int G1CP_GetFuncEnd(var int funcId) {
    return _HT_Get(G1CP_FuncEnds, funcId);
};
