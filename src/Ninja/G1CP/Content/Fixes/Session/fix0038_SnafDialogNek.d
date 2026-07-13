/*
 * #38 Snaf's Nek dialog disappears
 */
func int G1CP_0038_SnafDialogNek() {
    const string conditionFuncName = "DIA_Snaf_WhereNek_Condition";
    if (!G1CP_IsFunc(conditionFuncName, "int|none"))
    || (!G1CP_IsIntVar("Snaf_Zutaten")) {
        return FALSE;
    };

    HookDaedalusFuncS(conditionFuncName, "G1CP_0038_SnafDialogNek_Hook");
    return TRUE;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_0038_SnafDialogNek_Hook() {
    G1CP_ReportFuncToSpy();

    const int LOG_RUNNING = 1;
    const int LOG_SUCCESS = 2;

    // Backup variable content
    var int questId; questId = MEM_GetSymbolIndex("Snaf_Zutaten");
    var int questBak; questBak = G1CP_GetIntVarI(questId, 0, 0);

    // If the quest is successful, set it temporarily to 'running' to trigger the condition function
    if (questBak == LOG_SUCCESS) {
        G1CP_SetIntVarI(questId, 0, LOG_RUNNING);
    };

    // Call the function as usual, with the possibly modified variable
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Restore the variable we abused
    G1CP_SetIntVarI(questId, 0, questBak);

    // Pass on the return value
    return ret;
};
