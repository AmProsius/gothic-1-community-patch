/*
 * #26 Lares's guard doesn't attack the player
 */
func int G1CP_0026_LaresGuardAttacks() {
    const string conditionFuncName = "Info_Org_804_FirstWarn_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntConst("AIV_GUARDPASSAGE_STATUS")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0026_LaresGuardAttacks_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0026_LaresGuardAttacks_Hook() {
    G1CP_ReportFuncToSpy();

    if (G1CP_NpcGetAiVar(hero, "AIV_GUARDPASSAGE_STATUS", 0)) {
        return FALSE;
    };

    ContinueCall();
};
