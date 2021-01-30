/*
 * #24 Cor Kalom closes wrong quest
 */
func int Ninja_G1CP_024_CorKalomWrongQuest() {
    if (MEM_FindParserSymbol("Info_Kalom_KrautboteBACK_Info") != -1)
    && (MEM_FindParserSymbol("Kalom_DrugMonopol")             != -1)
    && (MEM_FindParserSymbol("Kalom_Krautbote")               != -1) {
        HookDaedalusFuncS("Info_Kalom_KrautboteBACK_Info", "Ninja_G1CP_024_CorKalomWrongQuest_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
* Intercept the dialog 'Info_Kalom_KrautboteBACK_Info'
*/
func void Ninja_G1CP_024_CorKalomWrongQuest_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

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
