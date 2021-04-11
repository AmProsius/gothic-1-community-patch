/*
 * #182 The gate guard can be bribed multiple times with Dusty as a follower
 */

/*
 * Make the topic and entry available to the functions below
 */
const string G1CP_182_GuardDialogDusty_Topic = "G1CP invalid string";
const string G1CP_182_GuardDialogDusty_Entry = "G1CP invalid string";

/*
 * Apply the fix
 */
func int G1CP_182_GuardDialogDusty() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int condId; condId = MEM_GetSymbolIndex("DIA_Grd_216_DustyZoll_Condition");
    var int funcId; funcId = MEM_GetSymbolIndex("DIA_Grd_216_DustyZoll_LittleWalk");
    var int entryFuncId; entryFuncId = MEM_GetSymbolIndex("B_LogEntry");
    var int topicId; topicId = MEM_GetSymbolIndex("CH1_RecruitDusty");
    if (funcId == -1) || (condId == -1) || (entryFuncId == -1) || (topicId == -1) {
        return FALSE;
    };

    // Find "B_LogEntry" in the dialog info function
    const int bytes[2] = {zPAR_TOK_CALL<<24, -1};
    var zCPar_Symbol symb; symb = _^(MEM_GetSymbolByIndex(entryFuncId));
    bytes[1] = symb.content;
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // There should only be one occurrence, otherwise the function was somehow modified and we cannot identify the entry
    if (MEM_ArraySize(matches) == 1) {
        var int pos; pos = MEM_ArrayRead(matches, 0);

        // B_LogEntry(arg1, arg2)
        var int arg1; arg1 = MEM_ReadInt(pos-9); // Topic
        var int arg2; arg2 = MEM_ReadInt(pos-4); // Entry
        G1CP_182_GuardDialogDusty_Topic = G1CP_GetStringI(arg1, 0, "G1CP invalid string");
        G1CP_182_GuardDialogDusty_Entry = G1CP_GetStringI(arg2, 0, "G1CP invalid string");

        // Confirm the log topic and that an entry was found
        if (Hlp_StrCmp(G1CP_182_GuardDialogDusty_Topic, G1CP_GetStringConstI(topicId, 0, "G1CP invalid string 2")))
        && (!Hlp_StrCmp(G1CP_182_GuardDialogDusty_Entry, "G1CP invalid string")) {
            // Hook the condition function
            HookDaedalusFuncS("DIA_Grd_216_DustyZoll_Condition", "G1CP_182_GuardDialogDusty_Hook");
            applied = TRUE;
        };
    };

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * This function intercepts the dialog condition to introduce more conditions
 */
func int G1CP_182_GuardDialogDusty_Hook() {
    G1CP_ReportFuncToSpy();

    // Add the new condition (other conditions remain untouched)
    if (G1CP_LogHasEntry(G1CP_182_GuardDialogDusty_Topic, G1CP_182_GuardDialogDusty_Entry)) {
        return FALSE;
    };

    // Continue with the original function
    ContinueCall();
};
