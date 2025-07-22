/*
 * #220 Gor Na Ran attacks the player character in chapter 6
 */
func int G1CP_0220_GorNaRanDialogMad() {
    if (G1CP_IsFunc("Info_TPL_1405_GorNaRan_Condition", "int|none")) {
        HookDaedalusFuncS("Info_TPL_1405_GorNaRan_Condition", "G1CP_0220_GorNaRanDialogMad_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * Hook the dialog condition function to disable it
 */
func int G1CP_0220_GorNaRanDialogMad_Hook() {
    G1CP_ReportFuncToSpy();

    // Always return false: The dialog is inaccessible
    return FALSE;
};
