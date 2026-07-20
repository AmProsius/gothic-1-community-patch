/*
 * #19 Scorpio's fight dialog doesn't disappear
 */
func int G1CP_0019_ScorpioFightDialog() {
    const string conditionFuncName = "DIA_Scorpio_REFUSETRAIN_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntVar("Kapitel")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0019_ScorpioFightDialog_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0019_ScorpioFightDialog_Hook() {
    G1CP_ReportFuncToSpy();

    if (G1CP_GetIntVar("Kapitel", 0) > 3) {
        return FALSE;
    };

    ContinueCall();
};
