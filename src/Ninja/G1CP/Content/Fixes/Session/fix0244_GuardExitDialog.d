/*
 * #244 Guard has duplicated END dialog
 */

/*
 * The fix function called from initialization
 *
 * Usually, to fix the duplicate exit dialog, the exit dialogs of the individual NPCs are deleted. However, the issue
 * might have been fixed by an underlying mod the other way around, by removing the ambient exit dialog (somehow). To
 * keep both variants in mind, this fix here works both ways. The condition function of the individual exit dialogs (if
 * present) is replaced to check if there is another exit dialog.
 */
func int G1CP_0244_GuardExitDialog() {
    // Find all necessary symbols
    if (!G1CP_IsStringConst("DIALOG_ENDE", 0)) {
        return FALSE;
    };
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Grd_245_Exit_Condition");

    if (G1CP_0042_ConfirmByteCode(funcId)) {
        HookDaedalusFuncI(funcId, MEM_GetFuncId(G1CP_0244_EndCond));
        return TRUE;
    };

    return FALSE;
};

/*
 * The additional condition
 */
func int G1CP_0244_EndCond() {
    G1CP_ReportFuncToSpy();
    return G1CP_0042_NewCondition(self);
};
