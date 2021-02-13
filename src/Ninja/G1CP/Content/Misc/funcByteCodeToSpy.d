/*
 * Print function byte code to spy
 */
func void Ninja_G1CP_FuncByteCodeToSpy(var int funcId) {
    if (funcId < 0) || (funcId >= currSymbolTableLength) {
        MEM_Warn("Invalid symbol ID");
        return;
    };

    var int symbPtr; symbPtr = MEM_GetSymbolByIndex(funcId);
    var int funcStart; funcStart = MEM_ReadInt(symbPtr + zCParSymbol_content_offset) + currParserStackAddress;

    var int tokens; tokens = MEM_ArrayCreate();
    var int params; params = MEM_ArrayCreate();
    var int positions; positions = MEM_ArrayCreate();
    MEMINT_TokenizeFunction(funcId, tokens, params, positions);
    var int len; len = MEM_ArraySize(tokens);

    repeat(i, len-1); var int i;
        var int tok; tok = MEM_ArrayRead(tokens, i);
        var int par; par = MEM_ArrayRead(params, i);
        var int pos; pos = MEM_ArrayRead(positions, i);

        var string msg;
        msg = ConcatStrings(Ninja_G1CP_LFill(IntToString(pos - funcStart), " ", 4), ":   ");
        msg = ConcatStrings(msg, MEM_ReadStatStringArr(PARSER_TOKEN_NAMES, tok));
        msg = ConcatStrings(msg, "   ");
        if (tok == zPAR_TOK_PUSHVAR)    || (tok == zPAR_TOK_PUSHINST)
        || (tok == zPAR_TOK_CALLEXTERN) || (tok == zPAR_TOK_SETINSTANCE) {
            // Symbol index
            msg = ConcatStrings(msg, MEM_ReadString(MEM_GetSymbolByIndex(par)));
        } else if (tok == zPAR_TOK_PUSH_ARRAYVAR) {
            // Symbol index
            msg = ConcatStrings(msg, MEM_ReadString(MEM_GetSymbolByIndex(par)));
            // Array index
            msg = ConcatStrings(msg, "[");
            msg = ConcatStrings(msg, IntToString(MEM_ReadByte(pos+5)));
            msg = ConcatStrings(msg, "]");
        } else if (tok == zPAR_TOK_CALL) {
            // Stack offset
            if (par >= 0) && (par < MEM_Parser.stack_stacksize) {
                msg = ConcatStrings(msg, MEM_ReadString(MEM_GetSymbolByIndex(MEM_GetFuncIDByOffset(par))));
            } else {
                msg = ConcatStrings(msg, IntToString(par));
            };
        } else if (tok == zPAR_TOK_JUMP) || (tok == zPAR_TOK_JUMPF) {
            // Stack offset+
            if (par >= 0) && (par < MEM_Parser.stack_stacksize) {
                var int jmpFncId; jmpFncId = MEM_GetFuncIDByOffset(par);
                symbPtr = MEM_GetSymbolByIndex(jmpFncId);
                var int stk; stk = MEM_ReadInt(symbPtr + zCParSymbol_content_offset);
                msg = ConcatStrings(msg, MEM_ReadString(symbPtr));
                msg = ConcatStrings(msg, "+");
                msg = ConcatStrings(msg, IntToString(par-stk));
            } else {
                msg = ConcatStrings(msg, IntToString(par));
            };
        } else if (tok == zPAR_TOK_PUSHINT) {
            // Literal
            msg = ConcatStrings(msg, IntToString(par));
            if (par > 0) && (par < currSymbolTableLength) {
                // Possibly symbol index
                msg = ConcatStrings(msg, "  (");
                msg = ConcatStrings(msg, MEM_ReadString(MEM_GetSymbolByIndex(par)));
                msg = ConcatStrings(msg, ")");
            };
        };
        MEM_Info(msg);
    end;

    MEM_ArrayFree(tokens);
    MEM_ArrayFree(params);
    MEM_ArrayFree(positions);
};
