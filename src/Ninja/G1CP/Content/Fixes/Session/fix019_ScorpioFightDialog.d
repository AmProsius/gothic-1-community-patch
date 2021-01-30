/*
 * #19 Scorpio's fight dialog doesn't disappear
 */
func int Ninja_G1CP_019_ScorpioFightDialog() {
    if (MEM_FindParserSymbol("DIA_Scorpio_REFUSETRAIN_Condition") != -1)
    && (MEM_FindParserSymbol("Kapitel") != -1) {
        HookDaedalusFuncS("DIA_Scorpio_REFUSETRAIN_Condition", "Ninja_G1CP_019_ScorpioFightDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_019_ScorpioFightDialog_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    var int symbPtr; symbPtr = MEM_GetSymbol("Kapitel"); // Might not exist
    if (symbPtr) {
        var zCPar_Symbol symb; symb = _^(symbPtr);
        if (symb.bitfield & zPAR_TYPE_INT) { // Another safety layer
            if (symb.content > 3) {
                return FALSE;
            };
        };
    };

    // Continue with the original function
    ContinueCall();
};
