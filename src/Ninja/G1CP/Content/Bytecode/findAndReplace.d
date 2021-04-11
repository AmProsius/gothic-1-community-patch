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

/*
 * Replace any function calls with a call to another. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceCall(var int funcIdOrStartAddr, var int zeroOrEndAddr, var int needleId, var int replaceId) {
    // Needle and replace can only be functions, because instance functions cannot be called from a function directly
    if (!G1CP_IsFuncI(needleId,  ""))
    || (!G1CP_IsFuncI(replaceId, "")) {
        return 0;
    };

    var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(needleId));
    var zCPar_Symbol replaceSymb; replaceSymb = _^(MEM_GetSymbolByIndex(replaceId));

    // Confirm matching return value type
    if (needleSymb.offset != replaceSymb.offset) {
        return 0;
    };

    // Confirm matching number of parameters
    var int pNum; pNum = (needleSymb.bitfield & zCPar_Symbol_bitfield_ele);
    if (pNum != (replaceSymb.bitfield & zCPar_Symbol_bitfield_ele)) {
        return 0;
    };
    if (needleId+pNum >= MEM_Parser.symtab_table_numInArray) || (replaceId+pNum >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };

    // Confirm matching parameter types
    var zCPar_Symbol pSymb;
    repeat(i, pNum); var int i;
        pSymb = _^(MEM_GetSymbolByIndex(needleId+1+i));
        var int t0; t0 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);
        pSymb = _^(MEM_GetSymbolByIndex(replaceId+1+i));
        var int t1; t1 = (pSymb.bitfield & zCPar_Symbol_bitfield_type);

        // Strings and instances are special, anything else is just pushed as integer
        if ((t0 == zPAR_TYPE_STRING)   && (t1 != zPAR_TYPE_STRING))
        || ((t0 != zPAR_TYPE_STRING)   && (t1 == zPAR_TYPE_STRING))
        || ((t0 == zPAR_TYPE_INSTANCE) && (t1 != zPAR_TYPE_INSTANCE))
        || ((t0 != zPAR_TYPE_INSTANCE) && (t1 == zPAR_TYPE_INSTANCE)) {
            return 0;
        };
    end;

    // Decide if Daedalus or external function
    const int bytes[2] = {-1, -1};
    if (needleSymb.bitfield & zPAR_FLAG_EXTERNAL) {
        bytes[0] = zPAR_TOK_CALLEXTERN << 24;
        bytes[1] = needleId;
    } else {
        bytes[0] = zPAR_TOK_CALL << 24;
        bytes[1] = needleSymb.content;
    };

    // Find function calls
    var int matches; matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 5, 0);

    // Overwrite each occurrence
    repeat(i, MEM_ArraySize(matches));
        MEMINT_OverrideFunc_Ptr = MEM_ArrayRead(matches, i);
        if (replaceSymb.bitfield & zPAR_FLAG_EXTERNAL) {
            MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, replaceId);
        } else {
            MEMINT_OFTokPar(zPAR_TOK_CALL, replaceSymb.content);
        };
    end;

    // Free the array and return
    var int count; count = MEM_ArraySize(matches);
    MEM_Free(matches);
    return count;
};

/*
 * Replace any integer assignments with another integer. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignInt(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int ele,
                               var int needle, var int replace) {
    // Make sure all exist
    if (!G1CP_IsInt(assignedSymb, ele)) {
        return 0;
    };

    // Check for integer assignments
    var int matches;
    const int bytes[3] = {-1, -1, -1};
    if (ele <= 0) {
        bytes[0] = zPAR_TOK_PUSHVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(assignedSymb);
        bytes[2] = zPAR_OP_IS;
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 6, 0);
    } else {
        bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
        bytes[1] = MEM_GetSymbolIndex(assignedSymb);
        bytes[2] = ele + (zPAR_OP_IS<<8);
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 7, 0);
    };

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check the pushed integer (variable) content against "needle"
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-4);
            if (G1CP_GetIntI(varId, 0, -needle) != needle) {
                continue;
            };
        } else if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) {
            var int par; par = MEM_ReadInt(pos-4);
            if (par != needle) {
                continue;
            };
        };

        // Overwrite the integer assignment with the replacement integer
        MEMINT_OverrideFunc_Ptr = pos-5;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINT, replace);
        count += 1;
    end;

    // Free the array
    MEM_Free(matches);

    return count;
};

/*
 * Replace any integer assignments with another integer (by its symbol ID). The function returns the number of
 * replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignIntID(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int ele,
                                 var int needle, var int replaceId) {
    // Make sure all exist
    if (!G1CP_IsIntI(replaceId, 0)) {
        return 0;
    };
    var int replace; replace = G1CP_GetIntI(replaceId, 0, 0);
    return G1CP_ReplaceAssignInt(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, ele, needle, replace);
};

/*
 * Replace any string assignments with another string (by its symbol ID). The function returns the number of
 * replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignStrID(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int ele,
                                 var string needle, var int replaceId) {
    // Make sure all exist
    if (!G1CP_IsStringConstI(replaceId, 0)) { // Must be a constant
        return 0;
    };

    // Check for assignment or only pushed string
    var int matches;
    var int offset;
    if (Hlp_StrCmp(assignedSymb, "")) {
        // Only check for pushed strings
        matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(zPAR_TOK_PUSHVAR), 1, 0);
        offset = 0;
    } else {
        // Check for string assignments
        if (!G1CP_IsString(assignedSymb, ele)) {
            return 0;
        };
        const int bytes[3] = {-1, -1, -1};
        if (ele <= 0) {
            bytes[0] = zPAR_TOK_PUSHVAR<<24;
            bytes[1] = MEM_GetSymbolIndex(assignedSymb);
            bytes[2] = zPAR_TOK_ASSIGNSTR;
            matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 6, 0);
        } else {
            bytes[0] = zPAR_TOK_PUSH_ARRAYVAR<<24;
            bytes[1] = MEM_GetSymbolIndex(assignedSymb);
            bytes[2] = ele + (zPAR_TOK_ASSIGNSTR<<8);
            matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 7, 0);
        };
        offset = 5;
    };

    // Iterate over all matches
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Check the pushed string content against "needle"
        if (MEM_ReadByte(pos-offset) == zPAR_TOK_PUSHVAR) {
            var int varId; varId = MEM_ReadInt(pos-offset+1);
            if (STR_Compare(G1CP_GetStringI(varId, 0, "G1CP invalid string"), needle) == STR_EQUAL) {

                // Overwrite the string assignment with the replacement string
                MEMINT_OverrideFunc_Ptr = pos-offset;
                MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, replaceId);
                count += 1;
            };
        };
    end;

    // Free the array
    MEM_Free(matches);

    return count;
};

/*
 * Replace any string assignments with another string. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceAssignStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string assignedSymb, var int ele,
                               var string needle, var string replace) {
    // Obtain the symbol index of the replacement string
    var int calledFrom; calledFrom = MEM_GetCallerStackPos()-5+MEM_Parser.stack_stack;
    if (MEM_ReadByte(calledFrom)   != zPAR_TOK_CALL)
    || (MEM_ReadInt(calledFrom+1)  != MEM_GetFuncOffset(G1CP_ReplaceAssignStr))
    || (MEM_ReadByte(calledFrom-5) != zPAR_TOK_PUSHVAR) {
        MEM_SendToSpy(zERR_TYPE_FAULT, "G1CP_ReplaceAssignStr called from invalid context");
        return 0;
    };
    var int replaceId; replaceId = MEM_ReadInt(calledFrom-4);

    // Pass on
    return G1CP_ReplaceAssignStrID(funcIdOrStartAddr, zeroOrEndAddr, assignedSymb, ele, needle, replaceId);
};

/*
 * Replace any pushed strings with another string (by its symbol ID). The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplacePushStrID(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string needle, var int replaceId) {
    // Pass on
    return G1CP_ReplaceAssignStrID(funcIdOrStartAddr, zeroOrEndAddr, "", 0, needle, replaceId);
};

/*
 * Replace any pushed strings with another string. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplacePushStr(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string needle, var string replace) {
    // Obtain the symbol index of the replacement string
    var int calledFrom; calledFrom = MEM_GetCallerStackPos()-5+MEM_Parser.stack_stack;
    if (MEM_ReadByte(calledFrom)   != zPAR_TOK_CALL)
    || (MEM_ReadInt(calledFrom+1)  != MEM_GetFuncOffset(G1CP_ReplacePushStr))
    || (MEM_ReadByte(calledFrom-5) != zPAR_TOK_PUSHVAR) {
        MEM_SendToSpy(zERR_TYPE_FAULT, "G1CP_ReplacePushStr called from invalid context");
        return 0;
    };
    var int replaceId; replaceId = MEM_ReadInt(calledFrom-4);

    // Pass on
    return G1CP_ReplaceAssignStrID(funcIdOrStartAddr, zeroOrEndAddr, "", 0, needle, replaceId);
};

/*
 * Replace speaker and listener of matching output unit calls by replacing the pushed instance IDs. The speaker and
 * listener instances are expected as symbol indices. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceOUInst(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string outputUnit,
                            var int needleIdSpeaker,  var int needleIdListener,
                            var int replaceIdSpeaker, var int replaceIdListener) {
    // Make sure all exist
    if (needleIdSpeaker < 0)   || (needleIdSpeaker >= MEM_Parser.symtab_table_numInArray)
    || (needleIdListener < 0)  || (needleIdListener >= MEM_Parser.symtab_table_numInArray)
    || (replaceIdSpeaker < 0)  || (replaceIdSpeaker >= MEM_Parser.symtab_table_numInArray)
    || (replaceIdListener < 0) || (replaceIdListener >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };

    // Find all matching output units calls
    const int bytes[2] = {zPAR_TOK_CALLEXTERN<<24, -1};
    bytes[1] = MEM_GetFuncID(AI_Output);
    var int matches; matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 5, 0);

    // Iterate over all calls and check the function arguments
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Read the arguments
        var int arg1; arg1 = MEM_ReadInt(pos-14); // zPAR_TOK_PUSHINST instance
        var int arg2; arg2 = MEM_ReadInt(pos-9);  // zPAR_TOK_PUSHINST instance
        var int arg3; arg3 = MEM_ReadInt(pos-4);  // zPAR_TOK_PUSHVAR  string

        // Confirm: AI_Output(needleIdSpeaker, needleIdListener, outputUnit);
        if (arg1 == needleIdSpeaker) && (arg2 == needleIdListener)
        && (Hlp_StrCmp(G1CP_GetStringI(arg3, 0, "G1CP invalid string"), outputUnit)) { // Either var or const

            // Assign new speaker and listener: AI_Output(replaceIdSpeaker, replaceIdListener, outputUnit);
            MEMINT_OverrideFunc_Ptr = pos-15;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceIdSpeaker);
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceIdListener);
            count += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return count;
};

/*
 * Add a condition to an if-statement (at a given address in memory) by squeezing in a function call. The address must
 * point to the token zPAR_TOK_JUMPF (execution of an if-condition).
 * The conjunction can either be zPAR_OP_LOG_AND or zPAR_OP_LOG_OR, corresponding to && and ||, respectively. It can
 * also be zero. The function must then either take one integer argument to replace the condition completely, or have
 * no return value to leave the if-condition untouched.
 *
 * With zPAR_OP_LOG_AND the if-condition will be extended like so
 *   if (foo || bar && baz) && new()
 *
 * With zPAR_OP_LOG_OR the if-condition will be extended like so
 *   if (foo || bar && baz) || new()
 *
 * With zero and one function parameter the if-condition will be replaced
 *   if new(foo || bar && baz)
 *
 * With zero and no function parameter or return value the if-condition will remain
 *   _ = (foo || bar && baz); // Evaluated (pushed)
 *   new();                   // Squeezed in
 *   if _                     // Executed (popped)
 */
func void G1CP_AddIfCondition(var int addr, var int conjunction, var func condition) {
    // Verify arguments
    if ((conjunction != 0) && (conjunction != zPAR_OP_LOG_AND) && (conjunction != zPAR_OP_LOG_OR))
    || (!addr) {
        return;
    };

    // Verify address context
    if (MEM_ReadByte(addr) != zPAR_TOK_JUMPF) {
        return;
    };

    // Get jump targets
    var int targetFalse; targetFalse = MEM_ReadInt(addr+1);           // Offset after the if-block (FALSE)
    var int targetTrue; targetTrue = addr+5 - MEM_Parser.stack_stack; // Offset inside the if-block (TRUE)

    // Write byte code with new condition
    var int detour; detour = MEM_Alloc(15 + (conjunction != 0)); // 15 or 16 bytes
    MEMINT_OverrideFunc_Ptr = detour;
    MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(condition));
    if (conjunction) {
        MEMINT_OFTok(conjunction);
    };
    MEMINT_OFTokPar(zPAR_TOK_JUMPF, targetFalse);
    MEMINT_OFTokPar(zPAR_TOK_JUMP, targetTrue);

    // Overwrite the jump to detour to our additional condition
    MEMINT_OverrideFunc_Ptr = addr;
    MEMINT_OFTokPar(zPAR_TOK_JUMP, detour - MEM_Parser.stack_stack);
};
