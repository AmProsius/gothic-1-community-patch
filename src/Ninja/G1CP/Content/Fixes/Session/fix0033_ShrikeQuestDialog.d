/*
 * #33 Shrike's Hut quest
 */
func int G1CP_0033_ShrikeQuestDialog() {
    const string conditionFuncName = "DIA_Shrike_GetLost_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || ((!G1CP_IsInfoInst("DIA_Gorn_Hut")) && (!G1CP_IsIntVar("Gorn_ShrikesHut"))) { // Either one must exist
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0033_ShrikeQuestDialog_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0033_ShrikeQuestDialog_Hook() {
    G1CP_ReportFuncToSpy();

    const int LOG_RUNNING = 1;
    var int logStatus; logStatus = G1CP_GetIntVar("Gorn_ShrikesHut", LOG_RUNNING);
    var int infoId; infoId = MEM_GetSymbolIndex("DIA_Gorn_Hut");
    var int knowsInfo; knowsInfo = (Npc_KnowsInfo(hero, infoId)) && (infoId != -1);

    if (!knowsInfo) && (logStatus != LOG_RUNNING) {
        return FALSE;
    };

    ContinueCall();
};
