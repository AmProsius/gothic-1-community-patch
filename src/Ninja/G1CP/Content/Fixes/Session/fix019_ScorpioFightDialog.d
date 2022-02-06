/*
 * #19 Scorpio's fight dialog doesn't disappear
 */
func int G1CP_019_ScorpioFightDialog() {
    if (G1CP_IsFunc("DIA_Scorpio_REFUSETRAIN_Condition", "int|none"))
    && (G1CP_IsIntVar("Kapitel", 0)) {
        HookDaedalusFuncS("DIA_Scorpio_REFUSETRAIN_Condition", "G1CP_019_ScorpioFightDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_019_ScorpioFightDialog_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_GetIntVar("Kapitel", 0, 0) > 3) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
