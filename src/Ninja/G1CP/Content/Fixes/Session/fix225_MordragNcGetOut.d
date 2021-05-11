/*
 * #225 Mordrag can be told to "get out" in New Camp
 */
func int G1CP_225_MordragNcGetOut() {
    const string CONDITION = ""; CONDITION = "Org_826_Mordrag_HauAb_Condition";

    if (!G1CP_IsFunc(CONDITION, "int|none"))
    || (!G1CP_IsInfoInst("Org_826_Mordrag_GotoNewcamp"))
    || (!G1CP_IsIntVar("Thorus_MordragKo", 0)) {
        return FALSE;
    };

    HookDaedalusFuncS(CONDITION, "G1CP_225_MordragNcGetOut_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_225_MordragNcGetOut_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Add the new conditions (other conditions remain untouched)
    var int cond1;
    var int cond2;

    // Check if dialog was told (check if symbol exists first!)
    var int symbId; symbId = MEM_GetSymbolIndex("Org_826_Mordrag_GotoNewcamp");
    if (symbId != -1) {
        cond1 = !Npc_KnowsInfo(hero, symbId);
    } else {
        cond1 = TRUE; // If the dialog does not even exist take no chances
    };

    // Check if quest is running (If that variable does not even exist take no chances)
    cond2 = (G1CP_GetIntVar("Thorus_MordragKo", 0, LOG_RUNNING) == LOG_RUNNING);

    // Return false if either of the conditions is false
    if ((!cond1) || (!cond2)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
