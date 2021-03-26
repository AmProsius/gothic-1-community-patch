/*
 * #37 Gravo not listed as merchant
 */

/*
 * Since applying and reverting both depend on finding the necessary symbols this is a toggle function
 */
func int G1CP_037_LogEntryGravoMerchant_Toggle(var int apply) {
    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    // Retrieve the topic and entry strings once and modify the info function
    const int    infoId  = -2; // -1 is reserved for invalid symbols
    const int    topicId = -2;
    const int    entryId = -2;
    const string topic   = "G1CP invalid topic name";
    const string entry   = "G1CP invalid topic entry";
    if (infoId == -2) {
        infoId = MEM_GetSymbolIndex("DIA_Gravo_HelpHow");
        topicId = MEM_GetSymbolIndex("GE_TraderOC");
        var int funcId; funcId = MEM_GetSymbolIndex("DIA_Gravo_HelpHow_Info");
        var int b_logentry_id; b_logentry_id = MEM_GetSymbolIndex("B_LogEntry");

        // Do this only once (this is never reverted, i.e. session fix)
        if (infoId == -1) || (funcId == -1) || (b_logentry_id == -1) || (topicId == -1) {
            return FALSE;
        };

        // Find all calls to 'B_LogEntry' within 'DIA_Gravo_HelpHow_Info'
        const int bytes[2] = {zPAR_TOK_CALL<<24, -1};
        var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(b_logentry_id));
        bytes[1] = needleSymb.content;
        var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

        /* We are looking for:
            zPAR_TOK_PUSHVAR GE_TraderOC
            zPAR_TOK_PUSHVAR xxxx
            zPAR_TOK_CALL    B_LogEntry
        */

        // Narrow down the search to calls with 'GE_TraderOC' as first argument to find the pushed entry
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
        if (entryId <= 0) {
            return FALSE;
        };

        // Get the topic strings
        topic = G1CP_GetStringVarByIndex(topicId, 0, topic);
        entry = G1CP_GetStringVarByIndex(entryId, 0, entry);

        // Now that all is established, let's replace the call to 'B_LogEntry' to squeeze in the creation of the topic
        i = G1CP_ReplaceCall(funcId, b_logentry_id, MEM_GetFuncID(G1CP_037_LogEntryGravoMerchant_Intercept));
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
            Log_CreateTopic(topic, LOG_NOTE);
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
 * Intercept the call of 'B_LogEntry' within 'DIA_Gravo_HelpHow_Info'
 */
func void G1CP_037_LogEntryGravoMerchant_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    // Check if this is the correct topic
    if (Hlp_StrCmp(topic, G1CP_GetStringVar("GE_TraderOC", 0, "G1CP invalid topic string")))
    && (!G1CP_LogGetTopic(topic)) {
        Log_CreateTopic(topic, LOG_NOTE);
        G1CP_SetFixStatus(37, G1CP_FIX_APPLIED); // If it did not exist before, our fix will have to be reverted
    };

    // Go on with the original call
    MEM_PushStringParam(topic);
    MEM_PushStringParam(entry);
    MEM_CallByString("B_LogEntry"); // Does exist as established by the function above
};

/*
 * This function applies the changes
 */
func int G1CP_037_LogEntryGravoMerchant() {
    return G1CP_037_LogEntryGravoMerchant_Toggle(TRUE);
};

/*
 * This function reverts the changes
 */
func int G1CP_037_LogEntryGravoMerchantRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(37)) {
        return FALSE;
    };

    return G1CP_037_LogEntryGravoMerchant_Toggle(FALSE);
};
