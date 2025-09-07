/*
 * Print byte code in certain range in memory to spy
 */
func void G1CP_ByteCodeToSpy(var int posStart, var int posEnd) {
    if (!posStart) || (!posEnd) {
        return;
    };

    // Operate on stack offsets, because of full 32 bit address space unsigned comparison
    posStart -= MEM_Parser.stack_stack;
    posEnd   -= MEM_Parser.stack_stack;
    var int pos; pos = posStart;

    MEM_Info("");
    while(pos <= posEnd);
        var int tok; tok = MEM_ReadByte(MEM_Parser.stack_stack + pos);
        var int par; par = MEM_ReadInt(MEM_Parser.stack_stack + pos + 1);

        var string msg;
        msg = ConcatStrings(G1CP_LFill(IntToString(pos - posStart), " ", 4), ":   ");
        msg = ConcatStrings(msg, MEM_ReadStatStringArr(PARSER_TOKEN_NAMES, tok));
        msg = ConcatStrings(msg, "   ");
        if (tok == zPAR_TOK_PUSHVAR)    || (tok == zPAR_TOK_PUSHINST)
        || (tok == zPAR_TOK_CALLEXTERN) || (tok == zPAR_TOK_SETINSTANCE) {
            // Symbol index
            msg = ConcatStrings(msg, G1CP_GetSymbolName(par));
            pos += 4;
        } else if (tok == zPAR_TOK_PUSH_ARRAYVAR) {
            // Symbol index
            msg = ConcatStrings(msg, G1CP_GetSymbolName(par));
            // Array index
            msg = ConcatStrings(msg, "[");
            msg = ConcatStrings(msg, IntToString(MEM_ReadByte(MEM_Parser.stack_stack + pos+5)));
            msg = ConcatStrings(msg, "]");
            pos += 5;
        } else if (tok == zPAR_TOK_CALL) {
            // Stack offset
            if (par >= 0) && (par < MEM_Parser.stack_stacksize) {
                msg = ConcatStrings(msg, G1CP_GetSymbolName(MEM_GetFuncIdByOffset(par)));
            } else {
                msg = ConcatStrings(msg, IntToString(par));
            };
            pos += 4;
        } else if (tok == zPAR_TOK_JUMP) || (tok == zPAR_TOK_JUMPF) {
            // Stack offset+
            if (par >= 0) && (par < MEM_Parser.stack_stacksize) {
                var int jmpFncId; jmpFncId = MEM_GetFuncIdByOffset(par);
                var int symbPtr; symbPtr = MEM_GetSymbolByIndex(jmpFncId);
                var int stk; stk = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
                msg = ConcatStrings(msg, MEM_ReadString(symbPtr));
                msg = ConcatStrings(msg, "+");
                msg = ConcatStrings(msg, IntToString(par-stk));
            } else {
                msg = ConcatStrings(msg, IntToString(par));
            };
            pos += 4;
        } else if (tok == zPAR_TOK_PUSHINT) {
            // Literal
            msg = ConcatStrings(msg, IntToString(par));
            if (par > 0) && (par < MEM_Parser.symtab_table_numInArray) {
                // Possibly symbol index
                msg = ConcatStrings(msg, "  (");
                msg = ConcatStrings(msg, G1CP_GetSymbolName(par));
                msg = ConcatStrings(msg, ")");
            };
            pos += 4;
        };
        pos += 1;
        MEM_Info(msg);
    end;
    MEM_Info("");
};

/*
 * Print function byte code to spy
 */
func void G1CP_FuncByteCodeToSpy(var int funcId) {
    G1CP_ByteCodeToSpy(G1CP_GetFuncStart(funcId), G1CP_GetFuncEnd(funcId));
};
