/*
 * #28 Mordrag doesn't refuse to escort the player
 */
func int Ninja_G1CP_028_MordragNoEscort() {
    if (MEM_FindParserSymbol("Org_826_Mordrag_GotoNewcamp_Condition") != -1)
    && (MEM_FindParserSymbol("MordragKO_HauAb") != -1) {
        HookDaedalusFuncS("Org_826_Mordrag_GotoNewcamp_Condition", "Ninja_G1CP_028_MordragNoEscort_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int Ninja_G1CP_028_MordragNoEscort_Hook() {
    Ninja_G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    var int symbPtr; symbPtr = MEM_GetSymbol("MordragKO_HauAb");
    if (symbPtr) {
        if (MEM_ReadInt(symbPtr + zCParSymbol_content_offset) == TRUE) {
            return FALSE;
        };
    };

    // Continue with the original function
    ContinueCall();
};
