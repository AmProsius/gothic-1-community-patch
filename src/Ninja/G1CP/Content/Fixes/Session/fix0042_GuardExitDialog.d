/*
 * #42 Guard has duplicated END dialog
 */

 /*
 * Check the content of a given function against: { return 1; }
 */
func int G1CP_0042_ConfirmByteCode(var int funcId) {
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

/*
 * The fix function called from initialization
 *
 * Usually, to fix the duplicate exit dialog, the exit dialogs of the individual NPCs are deleted. However, the issue
 * might have been fixed by an underlying mod the other way around, by removing the ambient exit dialog (somehow). To
 * keep both variants in mind, this fix here works both ways. The condition function of the individual exit dialogs (if
 * present) is replaced to check if there is another exit dialog.
 */
func int G1CP_0042_GuardExitDialog() {
    // Find all necessary symbols
    if (!G1CP_IsStringConst("DIALOG_ENDE", 0)) {
        return FALSE;
    };
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Grd_218_Exit_Condition");

    if (G1CP_0042_ConfirmByteCode(funcId)) {
        HookDaedalusFuncI(funcId, MEM_GetFuncId(G1CP_0042_EndCond));
        return TRUE;
    };

    return FALSE;
};

/*
 * The replacement functions with additional conditions
 */
func int G1CP_0042_NewCondition(var C_Npc slf) {
    // Define possibly missing symbols locally
    const string DIALOG_ENDE = "END";
    DIALOG_ENDE = G1CP_GetStringConst("DIALOG_ENDE", 0, DIALOG_ENDE);

    // Avoid recursion, because G1C_HasInfoWithDesc may call this very condition function
    const int recursion = FALSE;
    if (recursion) {
        return FALSE;
    };

    recursion = TRUE;
    var int hasEnd; hasEnd = G1CP_HasInfoWithDesc(slf, DIALOG_ENDE);
    recursion = FALSE;

    // Keep this one, if there is no other exit dialog
    return !hasEnd;
};

/*
 * The additional condition
 */
func int G1CP_0042_EndCond() {
    G1CP_ReportFuncToSpy();
    return G1CP_0042_NewCondition(self);
};
