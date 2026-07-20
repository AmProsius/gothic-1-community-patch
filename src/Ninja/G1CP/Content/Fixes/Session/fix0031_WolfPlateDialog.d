/*
 * #31 Wolf's minecrawler plate dialog doesn't disappear
 */
func int G1CP_0031_WolfPlateDialog() {
    const string conditionFuncName = "Info_Wolf_MCPLATESFEW_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsInfoInst("Info_Wolf_MCPLATESENOUGH")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0031_WolfPlateDialog_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0031_WolfPlateDialog_Hook() {
    G1CP_ReportFuncToSpy();

    if (Npc_KnowsInfo(hero, MEM_GetSymbolIndex("Info_Wolf_MCPLATESENOUGH"))) {
        return FALSE;
    };

    ContinueCall();
};
