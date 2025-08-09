/*
 * #24 Cor Kalom closes wrong quest
 */
func int G1CP_0024_CorKalomWrongQuest() {
    if (G1CP_IsFunc("Info_Kalom_KrautboteBACK_Info", "void|none"))
    && (G1CP_IsIntVar("Kalom_DrugMonopol"))
    && (G1CP_IsIntVar("Kalom_Krautbote")) {
        HookDaedalusFuncS("Info_Kalom_KrautboteBACK_Info", "G1CP_0024_CorKalomWrongQuest_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
* Intercept the dialog 'Info_Kalom_KrautboteBACK_Info'
*/
func void G1CP_0024_CorKalomWrongQuest_Hook() {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_SUCCESS = 2;

    // Local backups
    var int drugMonopolBak;
    var int drugMonopolPtr; drugMonopolPtr = 0;
    var int krautbotePtr;   krautbotePtr   = 0;

    // Check if symbols exist and backup current values
    var int symbPtr;
    symbPtr = MEM_GetSymbol("Kalom_DrugMonopol");
    if (symbPtr) {
        drugMonopolPtr = symbPtr + zCParSymbol_content_offset;
        drugMonopolBak = MEM_ReadInt(drugMonopolPtr);
    };
    symbPtr = MEM_GetSymbol("Kalom_Krautbote");
    if (symbPtr) {
        krautbotePtr = symbPtr + zCParSymbol_content_offset;
    };

    // Continue with the original function
    ContinueCall();

    // Reinstate and correct the variables
    if (drugMonopolPtr) {
        MEM_WriteInt(drugMonopolPtr, drugMonopolBak);
    };
    if (krautbotePtr) {
        MEM_WriteInt(krautbotePtr, LOG_SUCCESS);
    };
};
