/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 */
func int Ninja_G1CP_031_WolfPlateDialog() {
    if (MEM_FindParserSymbol("Info_Wolf_MCPLATESFEW_Condition")    != -1)
    && (MEM_FindParserSymbol("Info_Wolf_MCPLATESENOUGH_Condition") != -1)
    && (MEM_FindParserSymbol("Info_Wolf_MCPLATESENOUGH")           != -1) {
        HookDaedalusFuncS("Info_Wolf_MCPLATESFEW_Condition", "Ninja_G1CP_031_WolfPlateDialog_Hook1");
        HookDaedalusFuncS("Info_Wolf_MCPLATESENOUGH_Condition", "Ninja_G1CP_031_WolfPlateDialog_Hook2");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_031_WolfPlateDialog_Hook1() {
    Ninja_G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_FindParserSymbol("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */
func int Ninja_G1CP_031_WolfPlateDialog_Hook2() {
    Ninja_G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_FindParserSymbol("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
