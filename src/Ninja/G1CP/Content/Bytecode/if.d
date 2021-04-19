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
