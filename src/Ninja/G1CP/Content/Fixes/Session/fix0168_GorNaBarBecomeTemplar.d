/*
 * #168 Gor Na Bar offers to become a templar to anyone
 */
func int G1CP_0168_GorNaBarBecomeTemplar() {
    const string conditionFuncName = "Tpl_1400_GorNaBar_VICTORY_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntConst("GIL_NOV")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0168_GorNaBarBecomeTemplar_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0168_GorNaBarBecomeTemplar_Hook() {
    G1CP_ReportFuncToSpy();

    const int GIL_NOV = 0; GIL_NOV = G1CP_GetIntConst("GIL_NOV", 12);
    if (Npc_GetTrueGuild(hero) != GIL_NOV) {
        return FALSE;
    };

    ContinueCall();
};
