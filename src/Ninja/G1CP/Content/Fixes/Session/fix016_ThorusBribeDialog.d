/*
 * #16 Thorus' bribe dialog doesn't disappear
 */
func int G1CP_016_ThorusBribeDialog() {
    if (MEM_FindParserSymbol("Info_Thorus_Give1000Ore_Condition")    != -1)
    && (MEM_FindParserSymbol("Info_Thorus_LetterForMages_Condition") != -1)
    && (MEM_FindParserSymbol("AIV_PASSGATE")                         != -1)
    && ((MEM_FindParserSymbol("Grd_212_Torwache")                    != -1) // Either one of them has to exist
    ||  (MEM_FindParserSymbol("Grd_213_Torwache")                    != -1)) {
        HookDaedalusFuncS("Info_Thorus_Give1000Ore_Condition", "G1CP_016_ThorusBribeDialog_Hook1");
        HookDaedalusFuncS("Info_Thorus_LetterForMages_Condition", "G1CP_016_ThorusBribeDialog_Hook2");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_016_ThorusBribeDialog_Hook1() {
    G1CP_ReportFuncToSpy();

    // Check if passage to the castle is granted
    var int passGate1; passGate1 = G1CP_IdGetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", 0);
    var int passGate2; passGate2 = G1CP_IdGetAIVar(MEM_FindParserSymbol("Grd_213_Torwache"), "AIV_PASSGATE", 0);

    // Add the new condition (other conditions remain untouched)
    if (passGate1) || (passGate2) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */
func int G1CP_016_ThorusBribeDialog_Hook2() {
    G1CP_ReportFuncToSpy();

    // Check if passage to the castle is granted
    var int passGate1; passGate1 = G1CP_IdGetAIVar(MEM_FindParserSymbol("Grd_212_Torwache"), "AIV_PASSGATE", 0);
    var int passGate2; passGate2 = G1CP_IdGetAIVar(MEM_FindParserSymbol("Grd_213_Torwache"), "AIV_PASSGATE", 0);

    // Add the new condition (other conditions remain untouched)
    if (passGate1) || (passGate2) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
