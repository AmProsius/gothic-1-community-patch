/*
 * #42 Guards have duplicated END dialog
 */

/*
 * The fix function called from initialization
 *
 * Usually, to fix the duplicate exit dialog, the exit dialogs of the individual NPCs are deleted. However, the issue
 * might have been fixed by an underlying mod the other way around, by removing the ambient exit dialog (somehow). To
 * keep both variants in mind, this fix here works both ways. The condition function of the individual exit dialogs (if
 * present) is replaced to check if there is another exit dialog.
 */
func int G1CP_042_GuardExitDialog() {
    var int applied1; applied1 = FALSE;
    var int applied2; applied2 = FALSE;

    // Find all necessary symbols
    if (!G1CP_IsStringConst("DIALOG_ENDE", 0)) {
        return FALSE;
    };
    var int func1Id; func1Id = MEM_GetSymbolIndex("DIA_Grd_218_Exit_Condition");
    var int func2Id; func2Id = MEM_GetSymbolIndex("DIA_Grd_245_Exit_Condition");

    if (G1CP_ConfirmByteCode(func1Id)) {
        HookDaedalusFuncI(func1Id, MEM_GetFuncId(G1CP_042_Grd_218_Cond));
        applied1 = TRUE;
    };

    if (G1CP_ConfirmByteCode(func2Id)) {
        HookDaedalusFuncI(func2Id, MEM_GetFuncId(G1CP_042_Grd_245_Cond));
        applied2 = TRUE;
    };

    return (applied1) && (applied2);
};

/*
 * The additional conditions
 */
func int G1CP_042_Grd_218_Cond() {
    G1CP_ReportFuncToSpy();
    return G1CP_NpcCheckEndDialog(self);
};
func int G1CP_042_Grd_245_Cond() {
    G1CP_ReportFuncToSpy();
    return G1CP_NpcCheckEndDialog(self);
};
