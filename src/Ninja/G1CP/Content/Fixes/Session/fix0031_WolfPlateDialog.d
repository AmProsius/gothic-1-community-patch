/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 */
func int G1CP_0031_WolfPlateDialog() {
    if (!G1CP_IsFunc("Info_Wolf_MCPLATESFEW_Condition", "int|none"))
    || (!G1CP_IsInfoInst("Info_Wolf_MCPLATESENOUGH")) {
        return FALSE;
    };

    HookDaedalusFuncS("Info_Wolf_MCPLATESFEW_Condition", "G1CP_0031_WolfPlateDialog_Hook");
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0031_WolfPlateDialog_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    ContinueCall();
};
