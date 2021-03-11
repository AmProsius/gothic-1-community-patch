/*
 * #36 Fisk's quest isn't triggered
 */
func int G1CP_036_FiskFenceQuest() {
    if (MEM_FindParserSymbol("Stt_311_Fisk_MordragKO_Condition") != -1)
    && (MEM_FindParserSymbol("Org_826_Mordrag") != -1)
    && (MEM_FindParserSymbol("MordragKO_HauAb") != -1)
    && (MEM_FindParserSymbol("MordragKO_StayAtNC") != -1) {
        HookDaedalusFuncS("Stt_311_Fisk_MordragKO_Condition", "G1CP_036_FiskFenceQuest_Hook");
        return TRUE;
    } else {
        return FALSE;
    };
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_036_FiskFenceQuest_Hook() {
    G1CP_ReportFuncToSpy();

    // Fixing this dialog is a bit more challenging than the other ones, because the new condition should yield the
    // truth value of the condition to be true (not false like the other fixes usually) depending on other - possibly
    // unknown - conditions within the function.
    // So, one of the variables that is going to be checked will be temporarily set to true to make this happen.

    // Check if the variable exists
    var int hauAbBak;
    var int hauAbPtr; hauAbPtr = MEM_GetSymbol("MordragKO_HauAb");
    if (hauAbPtr) {
        hauAbPtr += zCParSymbol_content_offset;
        hauAbBak = MEM_ReadInt(hauAbPtr);
    };

    // If the variable exists but is false, overwrite it with our new truth value to implement an OR condition
    if (hauAbPtr) && (!hauAbBak) {

        // Check for variable
        var int stayAtNC; stayAtNC = MEM_GetSymbol("MordragKO_StayAtNC");
        if (stayAtNC) {
            stayAtNC = MEM_ReadInt(stayAtNC + zCParSymbol_content_offset);
        };

        // Check for Mordrag
        var C_Npc mordrag; mordrag = Hlp_GetNpc(MEM_FindParserSymbol("Org_826_Mordrag"));
        var int mordragDead; mordragDead = Npc_IsDead(mordrag);

        // The condition should now look like this:
        // if (otherConditions) && ((hauAb) || (mordragDead) || (stayAtNC)) {
        //     return TRUE;
        // };

        // Add as OR (since hauAbBak is False we could just omit it)
        MEM_WriteInt(hauAbPtr, (hauAbBak) || (mordragDead) || (stayAtNC));
    };

    // Call the function as usual, with the possibly modified variable
    ContinueCall();
    var int ret; ret = MEM_PopIntResult();

    // Restore the variable we abused
    if (hauAbPtr) {
        MEM_WriteInt(hauAbPtr, hauAbBak);
    };

    // Pass on the return value
    return ret;
};
