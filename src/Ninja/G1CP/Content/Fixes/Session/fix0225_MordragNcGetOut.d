/*
 * #225 Mordrag can be told to "get out" in New Camp
 */
func int G1CP_0225_MordragNcGetOut() {
    const string conditionFuncName = "Org_826_Mordrag_HauAb_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsInfoInst("Org_826_Mordrag_GotoNewcamp"))
    || (!G1CP_IsIntVar("Thorus_MordragKo")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0225_MordragNcGetOut_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0225_MordragNcGetOut_Hook() {
    G1CP_ReportFuncToSpy();

    const int LOG_RUNNING = 1;
    var int infoId; infoId = MEM_GetSymbolIndex("Org_826_Mordrag_GotoNewcamp");
    var int logStatus; logStatus = G1CP_GetIntVar("Thorus_MordragKo", LOG_RUNNING);

    if (Npc_KnowsInfo(hero, infoId)) || (logStatus != LOG_RUNNING) {
        return FALSE;
    };

    ContinueCall();
};
