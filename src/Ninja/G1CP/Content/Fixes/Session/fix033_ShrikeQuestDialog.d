/*
 * #33 Shrike's Hut quest
 */
func int G1CP_033_ShrikeQuestDialog() {
    if (MEM_GetSymbolIndex("DIA_Shrike_GetLost_Condition") != -1)
    && ((MEM_GetSymbolIndex("DIA_Gorn_Hut")                != -1) // Either the dialog or the quest must exist
    ||  (MEM_GetSymbolIndex("Gorn_ShrikesHut")             != -1)) {
        HookDaedalusFuncS("DIA_Shrike_GetLost_Condition", "G1CP_033_ShrikeQuestDialog_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_033_ShrikeQuestDialog_Hook() {
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

    // Check if quest is running
    var int symbPtr; symbPtr = MEM_GetSymbol("Gorn_ShrikesHut");
    if (symbPtr) {
        cond2 = (MEM_ReadInt(symbPtr + zCParSymbol_content_offset) == LOG_RUNNING);
    } else {
        cond2 = TRUE; // If that variable does not even exist take no chances
    };

    // Return false if neither of the conditions is true
    if ((!cond1) && (!cond2)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
