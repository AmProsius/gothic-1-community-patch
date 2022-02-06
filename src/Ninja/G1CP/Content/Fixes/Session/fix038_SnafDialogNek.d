/*
 * #38 Snaf's Nek dialog disappears
 */
func int G1CP_038_SnafDialogNek() {
    if (G1CP_IsFunc("DIA_Snaf_WhereNek_Condition", "int|none"))
    && (G1CP_IsIntVar("Snaf_Zutaten", 0)) {
        HookDaedalusFuncS("DIA_Snaf_WhereNek_Condition", "G1CP_038_SnafDialogNek_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_038_SnafDialogNek_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
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
