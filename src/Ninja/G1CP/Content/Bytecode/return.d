/*
 * Check the content of a given function against: { return 1; }
 */
func int G1CP_ConfirmByteCode(var int funcId) {
    if (!G1CP_IsFuncI(funcId, "int|none")) {
        return FALSE;
    };
    var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
    var int pos; pos = symb.content + MEM_Parser.stack_stack;

    // Ends with return
    if (MEM_ReadByte(pos+5) == zPAR_TOK_RET) {
        // And pushes a non-zero value onto the stack
        if (MEM_ReadByte(pos) == zPAR_TOK_PUSHINT) && (MEM_ReadInt(pos+1) != 0) {
            return TRUE;
        } else if (MEM_ReadByte(pos) == zPAR_TOK_PUSHVAR) && (G1CP_GetIntI(MEM_ReadInt(pos+1), 0, 0) != 0) {
            return TRUE;
        };
    };

    // Not found as expected
    return FALSE;
};
