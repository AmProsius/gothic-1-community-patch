/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 */
func int G1CP_031_WolfPlateDialog() {
    if (G1CP_IsFunc("Info_Wolf_MCPLATESFEW_Condition", "int|none"))
    && (G1CP_IsFunc("Info_Wolf_MCPLATESENOUGH_Condition", "int|none"))
    && (G1CP_IsInfoInst("Info_Wolf_MCPLATESENOUGH")) {
        HookDaedalusFuncS("Info_Wolf_MCPLATESFEW_Condition", "G1CP_031_WolfPlateDialog_Hook1");
        HookDaedalusFuncS("Info_Wolf_MCPLATESENOUGH_Condition", "G1CP_031_WolfPlateDialog_Hook2");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_031_WolfPlateDialog_Hook1() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};

/*
 * Exact copy of the function above. Need unique functions for both because of the way Daedalus hooks work
 */
func int G1CP_031_WolfPlateDialog_Hook2() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
