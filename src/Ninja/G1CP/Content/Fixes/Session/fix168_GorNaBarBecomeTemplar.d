/*
 * #168 Gor Na Bar offers to become a templar to anyone
 */
func int G1CP_168_GorNaBarBecomeTemplar() {
    if (G1CP_IsFunc("Tpl_1400_GorNaBar_VICTORY_Condition", "int|none"))
    && (G1CP_IsIntConst("GIL_NOV", 0)) {
        HookDaedalusFuncS("Tpl_1400_GorNaBar_VICTORY_Condition", "G1CP_168_GorNaBarBecomeTemplar_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_168_GorNaBarBecomeTemplar_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int GIL_NOV = 12;

    // Add the new condition (other conditions remain untouched)
    if (Npc_GetTrueGuild(hero) != GIL_NOV) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
