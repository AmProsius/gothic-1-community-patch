/*
 * #38 Snaf's Nek dialog disappears
 */
func int G1CP_038_SnafDialogNek() {
    if (MEM_GetSymbolIndex("DIA_Snaf_WhereNek_Condition") != -1)
    && (MEM_GetSymbolIndex("Snaf_Zutaten") != -1) {
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

    // Check if the variable exists
    var int questBak;
    var int questPtr; questPtr = MEM_GetSymbol("Snaf_Zutaten");
    if (questPtr) {
        questPtr += zCParSymbol_content_offset;
        questBak = MEM_ReadInt(questPtr);

        // If the quest is successful, set it temporarily to 'running' to trigger the condition function
        if (questBak == LOG_SUCCESS) {
            MEM_WriteInt(questPtr, LOG_RUNNING);
        };
    };

    // Call the function as usual, with the possibly modified variable
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Restore the variable we abused
    if (questPtr) {
        MEM_WriteInt(questPtr, questBak);
    };

    // Pass on the return value
    return ret;
};
