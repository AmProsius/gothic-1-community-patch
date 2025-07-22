/*
 * #204 Cavalorn not listed as tutor
 */
func int G1CP_0204_LogEntryCavalornTutor() {
    // Check the necessary symbols
    var int topicId; topicId = G1CP_GetStringConstId("GE_TeacherOW", 0);
    var int funcId; funcId = G1CP_GetFuncId("DIA_Fingers_WhereCavalorn_Info", "void|none");
    var int b_logentry_id; b_logentry_id = G1CP_GetFuncId("B_LogEntry", "void|string|string");
    if (funcId == -1) || (b_logentry_id == -1) || (topicId == -1) {
        return FALSE;
    };

    // Get the name of the topic
    var string topic; topic = G1CP_GetStringConstI(topicId, 0, "");

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

    // Narrow down the search to calls with the correct topic as first argument
    var int found; found = FALSE;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);
        if (MEM_ReadByte(pos-10) == zPAR_TOK_PUSHVAR) {
            if (Hlp_StrCmp(G1CP_GetStringI(MEM_ReadInt(pos-9), 0, "G1CP invalid string 1"), topic)) {
                found = TRUE;
                break;
            };
        };
    end;
    MEM_ArrayFree(matches);

    // Check if the correct topic is referred to
    if (!found) {
        return FALSE;
    };

    // Now that all is established, let's replace the call to 'B_LogEntry' to squeeze in the creation of the topic
    return (G1CP_ReplaceCall(funcId, 0, b_logentry_id, MEM_GetFuncId(G1CP_0204_LogEntryCavalornTutor_Intercept)) > 0);
};

/*
 * Intercept the call of 'B_LogEntry' within the dialog function
 */
func void G1CP_0204_LogEntryCavalornTutor_Intercept(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int LOG_NOTE = 1;

    // Check if this is the correct topic
    if (Hlp_StrCmp(topic, G1CP_GetStringConst("GE_TeacherOW", 0, "G1CP invalid string")))
    && (!G1CP_LogGetTopic(topic)) {
        Log_CreateTopic(topic, LOG_NOTE);
    };

    // Go on with the original call
    MEM_PushStringParam(topic);
    MEM_PushStringParam(entry);
    MEM_CallByString("B_LogEntry"); // Does exist as established by the function above
};
