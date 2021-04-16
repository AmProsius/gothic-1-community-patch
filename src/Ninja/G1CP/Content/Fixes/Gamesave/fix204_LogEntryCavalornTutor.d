/*
 * #204 Cavalorn not listed as tutor
 */

/*
 * Since applying and reverting both depend on finding the necessary symbols this is a toggle function
 */
func int G1CP_204_LogEntryCavalornTutor_Toggle(var int apply) {
    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_NOTE    = 1;

    // Parameters of this fix
    const int    topicSection  = LOG_NOTE;
    const string topicSymbName = "GE_TeacherOW";
    const string infoSymbName  = "DIA_Fingers_WhereCavalorn";
    const string funcSymbName  = "DIA_Fingers_WhereCavalorn_Info";
    const string hookSymbName  = "G1CP_204_LogEntryCavalornTutor_Intercept";

    // Retrieve the topic and entry strings once and modify the info function
    const int    infoId  = -2; // -1 is reserved for invalid symbols
    const int    topicId = -1;
    const int    entryId = -1;
    const string topic   = "G1CP invalid topic name";
    const string entry   = "G1CP invalid topic entry";
    if (infoId == -2) {
        infoId = MEM_GetSymbolIndex(infoSymbName);
        topicId = MEM_GetSymbolIndex(topicSymbName);
        var int funcId; funcId = MEM_GetSymbolIndex(funcSymbName);
        var int b_logentry_id; b_logentry_id = MEM_GetSymbolIndex("B_LogEntry");

        // Do this only once (this is never reverted, i.e. session fix)
        if (infoId == -1) || (funcId == -1) || (b_logentry_id == -1) || (topicId == -1) {
            return FALSE;
        };

        // Find all calls to 'B_LogEntry' within the dialog function
        const int bytes[2] = {zPAR_TOK_CALL<<24, -1};
        var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(b_logentry_id));
        bytes[1] = needleSymb.content;
        var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

        /* We are looking for:
            zPAR_TOK_PUSHVAR topic
            zPAR_TOK_PUSHVAR xxxx
            zPAR_TOK_CALL    B_LogEntry
        */

        // Narrow down the search to calls with the correct topic as first argument to find the pushed entry
        repeat(i, MEM_ArraySize(matches)); var int i;
            var int pos; pos = MEM_ArrayRead(matches, i);
            if (MEM_ReadByte(pos-10) == zPAR_TOK_PUSHVAR) && (MEM_ReadInt(pos-9) == topicId)
            && (MEM_ReadByte(pos-5)  == zPAR_TOK_PUSHVAR) {
                entryId = MEM_ReadInt(pos-4);
                break;
            };
        end;
        MEM_ArrayFree(matches);

        // Check if we have found a valid entry
        if (entryId <= 0) || (entryId >= MEM_Parser.symtab_table_numInArray) {
            return FALSE;
        };

        // Get the topic strings
        topic = G1CP_GetStringConstI(topicId, 0, topic);
        entry = G1CP_GetStringI(entryId, 0, entry);

        // Now that all is established, let's replace the call to 'B_LogEntry' to squeeze in the creation of the topic
        i = G1CP_ReplaceCall(funcId, 0, b_logentry_id, MEM_GetSymbolIndex(hookSymbName));
        if (i <= 0) {
            return FALSE;
        };
    };

    // Now, on to the actual revertible fix
    if (infoId == -1) || (entryId == -1) || (topicId == -1) {
        return FALSE;
    };

    // Apply or revert
    if (apply) {

        // Add the log entry silently if it should be there
        if (Npc_KnowsInfo(hero, infoId))
        && (!G1CP_LogHasEntry(topic, entry)) {
            Log_CreateTopic(topic, topicSection);
            Log_AddEntry(topic, entry);
            G1CP_LogMoveEntryToTop(topic, entry); // Move entry to the top otherwise it is always the newest entry
            return TRUE;
        };
    } else {

        // Revert the fix by removing the entry again
        G1CP_LogRemoveEntry(topic, entry);
        if (!G1CP_LogHasEntry(topic, entry)) {
            return TRUE;
        };
    };

    // Even if the dialog function is fixed, the fix is not marked as applied here!
    return FALSE;
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_204_LogEntryCavalornTutor_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_NOTE    = 1;

    // Parameters of this fix
    const string topicSymbName = "GE_TeacherOW";
    const int    topicSection  = LOG_NOTE;

    // Check if this is the correct topic
    if (Hlp_StrCmp(topic, G1CP_GetStringConst(topicSymbName, 0, "G1CP invalid topic string")))
    && (!G1CP_LogGetTopic(topic)) {
        Log_CreateTopic(topic, topicSection);
        G1CP_SetFixStatus(204, G1CP_FIX_APPLIED); // If it did not exist before, our fix will have to be reverted
    };

    // Go on with the original call
    MEM_PushStringParam(topic);
    MEM_PushStringParam(entry);
    MEM_CallByString("B_LogEntry"); // Does exist as established by the function above
};

/*
 * This function applies the changes
 */
func int G1CP_204_LogEntryCavalornTutor() {
    return G1CP_204_LogEntryCavalornTutor_Toggle(TRUE);
};

/*
 * This function reverts the changes
 */
func int G1CP_204_LogEntryCavalornTutorRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(204)) {
        return FALSE;
    };

    return G1CP_204_LogEntryCavalornTutor_Toggle(FALSE);
};
