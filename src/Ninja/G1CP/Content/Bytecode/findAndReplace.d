/*
 * Find all occurrences of given bytecode in specified regions in the code stack. The return value is an array
 * containing the (start) addresses in memory of all matches.
 * The first two parameters may either be the start and end addresses in memory (to probe a specific region), a function
 * symbol index and zero (to probe the contents of a specific function), or both zero (to probe the entire code stack).
 * Any search needs to start with a token byte (e.g. zPAR_TOK_PUSHVAR), as comparison happens starting from each token.
 */
func int G1CP_FindInCode(var int funcIdOrStartAddr, var int zeroOrEndAddr, var int needle, var int byteCount,
                         var int array) {
    // Create array to collect all matches (even if exiting prematurely, to always provide an array as return value)
    if (!array) {
        array = MEM_ArrayCreate();
    };

    // Set start and end accordingly
    var int addrStart; var int addrEnd;
    if (!funcIdOrStartAddr) && (!zeroOrEndAddr) {
        // Search the entire code stack
        addrStart = MEM_Parser.stack_stack;
        addrEnd = MEM_Parser.stack_stacklast-1;
    } else if (!zeroOrEndAddr) {
        // Search a function specified by its symbol index as the first argument
        addrStart = G1CP_GetFuncStart(funcIdOrStartAddr);
        addrEnd   = G1CP_GetFuncEnd(funcIdOrStartAddr);
    } else {
        // Search a specified region in the code stack
        addrStart = funcIdOrStartAddr;
        addrEnd = zeroOrEndAddr;
    };

    // Verify start and end positions (do on stack offsets, because of full 32 bit address space unsigned comparison)
    var int offsetStart; offsetStart = addrStart - MEM_Parser.stack_stack;
    var int offsetEnd;   offsetEnd   = addrEnd   - MEM_Parser.stack_stack;
    if (offsetStart < 0) || (offsetEnd >= MEM_Parser.stack_stacksize)
    || (!needle) || (!byteCount) {
        return array;
    };

    // Stop comparing before the end
    addrEnd -= byteCount-1;

    // Iterate over token/parameter chunks (in machine code for performance)
    const int zCArray_int__InsertEnd = 5439504; //0x530010
    const int code = 0;
    if (!code) {
        const int c = zCArray_int__InsertEnd;
        ASM_Open(88+1);
        ASM_1(96);                           // pusha
        ASM_2(3467);  ASM_4(_@(addrStart));  // mov    ecx, addrStart
        // loopStart:
        ASM_1(161);   ASM_4(_@(addrEnd));    // mov    eax, addrEnd
        ASM_2(49465);                        // cmp    ecx, eax
        ASM_2(630);                          // jbe    cont
        ASM_1(97);                           // popa
        ASM_1(195);                          // ret
        // cont:
        ASM_1(81);                           // push   ecx
        ASM_2(52873);                        // mov    esi,ecx
        ASM_2(15755); ASM_4(_@(needle));     // mov    edi, needle
        ASM_2(3467);  ASM_4(_@(byteCount));  // mov    ecx, byteCount
        ASM_1(252);                          // cld
        ASM_2(42739);                        // repe cmpsb
        ASM_2(3189);                         // jnz    tokenSize
        ASM_1(84);                           // push   esp
        ASM_2(3467);  ASM_4(_@(array));      // mov    ecx, array
        ASM_1(232);   ASM_4(c-ASM_Here()-4); // call   zCArray<int>::InsertEnd
        // tokenSize:
        ASM_1(89);                           // pop    ecx
        ASM_2(4491);                         // mov    edx, [ecx]
        ASM_1(184);   ASM_4(5);              // mov    eax, 0x5
        ASM_3(12802701);                     // lea    ebx, [edx-0x3D]
        ASM_3(523136);                       // cmp    bl, 0x7
        ASM_2(4726);                         // jbe    loopAdvance
        ASM_3(11885197);                     // lea    ebx, [edx-0x4B]
        ASM_3(392064);                       // cmp    bl, 0x5
        ASM_2(2678);                         // jbe    loopAdvance
        ASM_3(16120448);                     // cmp    dl, 0xF5
        ASM_3(12620815);                     // sete   al
        ASM_4(25183373);                     // lea    eax, [eax+0x1+eax*0x4]
        // loopAdvance:
        ASM_2(49409);                        // add    ecx, eax
        ASM_2(45035);                        // jmp    loopStart
        code = ASM_Close();
    };
    ASM_Run(code);

    return array;
};

/*
 * Find all occurrences of given bytecode in a function. The function returns the number of replacements.
 */
func int G1CP_FindInFunc(var int funcId, var int needle, var int byteCount) {
    return G1CP_FindInCode(funcId, 0, needle, byteCount, 0);
};
