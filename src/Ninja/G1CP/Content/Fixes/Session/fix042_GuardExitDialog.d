/*
 * #42 Guards have duplicated END dialog
 */

/*
 * Check the content of a given function against: { return 1; }
 */
func int Ninja_G1CP_042_ConfirmByteCode(var int funcId) {
    if (funcId <= 0) || (funcId >= currSymbolTableLength) {
        return FALSE;
    };
    var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(funcId));
    var int pos; pos = symb.content + currParserStackAddress;

    // Ends with return
    if (MEM_ReadByte(pos+5) == zPAR_TOK_RET) {
        // And pushes a non-zero value onto the stack
        if (MEM_ReadByte(pos) == zPAR_TOK_PUSHINT) && (MEM_ReadInt(pos+1) != 0) {
            return TRUE;
        } else if (MEM_ReadByte(pos) == zPAR_TOK_PUSHVAR) {
            // If it's a variable, check it's contents instead
            var int varId; varId = MEM_ReadInt(pos+1);
            if (varId > 0) && (varId < currSymbolTableLength) {
                var int varSymbPtr; varSymbPtr = MEM_GetSymbolByIndex(varId);
                if (varSymbPtr) {
                    return (MEM_ReadInt(varSymbPtr + zCParSymbol_content_offset) != 0);
                };
            };
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
 * present) is replaced to check if there is another exit dialog (this is only done very roughly based on exit dialogs
 * we know).
 */
func int Ninja_G1CP_042_GuardExitDialog() {
    var int applied1; applied1 = FALSE;
    var int applied2; applied2 = FALSE;

    // Find all necessary symbols
    var int func1Id; func1Id = MEM_FindParserSymbol("DIA_Grd_218_Exit_Condition");
    var int func2Id; func2Id = MEM_FindParserSymbol("DIA_Grd_245_Exit_Condition");

    if (Ninja_G1CP_042_ConfirmByteCode(func1Id)) {
        HookDaedalusFuncI(func1Id, MEM_GetFuncId(Ninja_G1CP_042_Grd_218_Cond));
        applied1 = TRUE;
    };

    if (Ninja_G1CP_042_ConfirmByteCode(func2Id)) {
        HookDaedalusFuncI(func2Id, MEM_GetFuncId(Ninja_G1CP_042_Grd_245_Cond));
        applied2 = TRUE;
    };

    return (applied1) && (applied2);
};

/*
 * The replacement functions with additional conditions
 */
func int Ninja_G1CP_042_NewCondition(var C_Npc slf) {
    // Check all possible ambient guard EXIT dialogs (voices might have changed)
    var int infoPtr[3];
    infoPtr[0] = Ninja_G1CP_GetInfo("Info_Grd_6_EXIT");
    infoPtr[1] = Ninja_G1CP_GetInfo("Info_Grd_7_EXIT");
    infoPtr[2] = Ninja_G1CP_GetInfo("Info_Grd_13_EXIT");

    // Check if they are assigned to this NPC
    repeat(i, 3); var int i;
        var int ptr; ptr = MEM_ReadStatArr(infoPtr, i);
        if (ptr) {
            var oCInfo info; info = _^(ptr);
            if (info.npc == Hlp_GetInstanceId(slf)) {
                return FALSE;
            };
        };
    end;

    // Does not have any exit dialog already: Keep this one
    return TRUE;
};
func int Ninja_G1CP_042_Grd_218_Cond() {
    Ninja_G1CP_ReportFuncToSpy();
    return Ninja_G1CP_042_NewCondition(self);
};
func int Ninja_G1CP_042_Grd_245_Cond() {
    Ninja_G1CP_ReportFuncToSpy();
    return Ninja_G1CP_042_NewCondition(self);
};
