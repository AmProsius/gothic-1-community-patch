/*
 * #27 Drax requires no beer for teaching hunting skills
 *
 * What this fix does:
 * 1. Check if "zCPar_TOK_PUSHVAR  drax_Lehrer_frei" is in "Org_819_Drax_Scavenger_Info"
 * 2. If yes, replace the "zCPar_TOK_PUSH..." before by a function call to return TRUE or the value itself
 * 3. If yes, replace the function call "Log_CreateTopic" in "Org_819_Drax_Scavenger_Info" by a function
 *    that checks for "LOG_NOTE" and does the same check as above
 * 4. Optionally (if exists) replace the function call "B_LogEntry" to avoid a screen print (does not affect success)
 */
func int G1CP_027_DraxTeachingDialog() {
    var int applied1; applied1 = FALSE;
    var int applied2; applied2 = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = MEM_FindParserSymbol("Org_819_Drax_Scavenger_Info");
    var int condId; condId = MEM_FindParserSymbol("drax_bierbekommen");
    var int varSymbId; varSymbId = MEM_FindParserSymbol("drax_Lehrer_frei");
    if (funcId == -1) || (varSymbId == -1) || (condId == -1) {
        return FALSE;
    };

    // Find "drax_Lehrer_frei = xxx" in the dialog function
    const int bytes[3] = {zPAR_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
    bytes[1] = varSymbId;
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 6);

    // Replace the "xxx" in "drax_Lehrer_frei = xxx"
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHINT) || (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            MEMINT_OverrideFunc_Ptr = pos-5;
            MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_027_SetVar));
            applied1 = TRUE;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    // Replace function call "Log_CreateTopic" only if the above bytes were replaced successfully
    if (applied1) {
        var int createOldId; createOldId = MEM_GetFuncId(Log_CreateTopic);
        var int createNewId; createNewId = MEM_GetFuncId(G1CP_027_CreateTopic);
        applied2 = G1CP_ReplaceCallInFunc(funcId, createOldId, createNewId);
    };

    // Optionally replace function call "B_LogEntry" (if exists) for removing the screen print
    if (applied2) {
        var int logEntryOld; logEntryOld = MEM_FindParserSymbol("B_LogEntry");
        var int logEntryNew; logEntryNew = MEM_GetFuncId(G1CP_027_TopicEntry);
        if (logEntryOld != -1) {
            i = G1CP_ReplaceCallInFunc(funcId, logEntryOld, logEntryNew);
        };
    };

    // Return true if both operations were successful
    return (applied1) && (applied2);
};

/*
 * Intercept the assignment of "drax_Lehrer_frei"
 * The fix will only work if "drax_bierbekommen" is assigned BEFORE "drax_Lehrer_frei" (true in the original).
 */
func int G1CP_027_SetVar() {
    G1CP_ReportFuncToSpy();

    // Check if the truth value of the variable "drax_bierbekommen"
    if (G1CP_GetIntVar("drax_bierbekommen", 0, FALSE)) {
        return TRUE; // Teaching unlocked
    } else {
        return G1CP_GetIntVar("drax_Lehrer_frei", 0, FALSE); // Variable as before
    };
};

/*
 * Wrapper function for "Log_CreateTopic"
 * The fix will only work if "drax_bierbekommen" and "drax_Lehrer_frei" are assigned BEFORE (true in the original).
 */
func void G1CP_027_CreateTopic(var string topic, var int section) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    // Check if both "drax_bierbekommen" and "drax_Lehrer_frei" are true
    if (section == LOG_NOTE) {
        if (!G1CP_GetIntVar("drax_bierbekommen", 0, FALSE))
        || (!G1CP_GetIntVar("drax_Lehrer_frei", 0, FALSE)) {
            return;
        };
    };

    // If allow, pass on the call
    Log_CreateTopic(topic, section);
};

/*
 * Wrapper function for "B_LogEntry"
 * The entry will only be added if the topic already exists (and is a note)
 */
func void G1CP_027_TopicEntry(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    // Check if both topic exists (and is a note)
    if (G1CP_GetTopicSection(topic) != LOG_NOTE) {
        return;
    };

    // If allow, pass on the call (symbol's existence is confirmed by the functions above)
    MEM_PushStringParam(topic);
    MEM_PushStringParam(entry);
    MEM_CallByString("B_LogEntry");
};
