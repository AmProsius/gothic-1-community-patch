/*
 * #33 Shrike's Hut quest
 */
func int G1CP_0033_ShrikeQuestDialog() {
    if (G1CP_IsFunc("DIA_Shrike_GetLost_Condition", "int|none"))
    && ((G1CP_IsInfoInst("DIA_Gorn_Hut")) || (G1CP_IsIntVar("Gorn_ShrikesHut", 0))) { // Either one must exist
        HookDaedalusFuncS("DIA_Shrike_GetLost_Condition", "G1CP_0033_ShrikeQuestDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0033_ShrikeQuestDialog_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_RUNNING = 1;

    // Add the new conditions (other conditions remain untouched)
    var int cond1;
    var int cond2;

    // Check if dialog was told (check if symbol exists first!)
    var int symbId; symbId = MEM_GetSymbolIndex("DIA_Gorn_Hut");
    if (symbId != -1) {
        cond1 = Npc_KnowsInfo(hero, symbId);
    } else {
        cond1 = TRUE; // If the dialog does not even exist take no chances
    };

    // Check if quest is running (If that variable does not even exist take no chances)
    cond2 = (G1CP_GetIntVar("Gorn_ShrikesHut", 0, LOG_RUNNING) == LOG_RUNNING);

    // Return false if neither of the conditions is true
    if ((!cond1) && (!cond2)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
