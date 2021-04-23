/*
 * #223 "The Big Thing of the Brotherhood" creates log entries for Old and New Camp
 */
func int G1CP_223_CarKalomSpyQuest() {
    var int applied; applied = FALSE;

    // Get all necessary symbols
    var int funcId; funcId = G1CP_GetFuncId("Info_CorKalom_BringMCQBalls_Success_Info", "void|none");
    var int bLogEntryId; bLogEntryId = G1CP_GetFuncId("B_LogEntry", "void|string|string");
    var int topic1Id; topic1Id = G1CP_GetStringConstId("CH1_GotoPsiCamp", 0);
    var int topic2Id; topic2Id = G1CP_GetStringConstId("CH1_GotoPsi", 0);
    if (funcId == -1) || (bLogEntryId == -1) || (topic1Id == -1) || (topic2Id == -1)
    || (!G1CP_IsIntVar("Mordrag_GotoKalom", 0)) || (!G1CP_IsIntVar("Raven_SpySect", 0))
    || (!G1CP_IsNpcInst("ORG_826_Mordrag")) {
        return FALSE;
    };

    // Get the topic names
    const string CH1_GotoPsiCamp = ""; CH1_GotoPsiCamp = G1CP_GetStringConstI(topic1Id, 0, CH1_GotoPsiCamp);
    const string CH1_GotoPsi = ""; CH1_GotoPsi = G1CP_GetStringConstI(topic2Id, 0, CH1_GotoPsi);

    // Check if the fix is even necessary
    if (!Hlp_StrCmp(CH1_GotoPsiCamp, CH1_GotoPsi)) {
        return FALSE;
    };

    // Find all calls to "B_LogEntry" in "Info_CorKalom_BringMCQBalls_Success_Info"
    var int matches; matches = G1CP_FindCall(funcId, 0, bLogEntryId);

    // Iterate over all occurrences to find the specific match
    repeat(i, MEM_ArraySize(matches)-1); var int i;
        var int addr; addr = MEM_ArrayRead(matches, i);
        var int addrNext; addrNext = MEM_ArrayRead(matches, i+1);

        /* We are looking for

        -10  zPAR_TOK_PUSHVAR   CH1_GotoPsiCamp
         -5  zPAR_TOK_PUSHVAR   xxxx
          0  zPAR_TOK_CALL      B_LogEntry            <-- addr
         +5  zPAR_TOK_PUSHVAR   CH1_GotoPsi
        +10  zPAR_TOK_PUSHVAR   xxxx
        +15  zPAR_TOK_CALL      B_LogEntry            <-- addrNexx
        */

        // First check position of the next found call
        if (addrNext != addr+15) {
            continue;
        };

        // Next check the first arguments of both
        if (!Hlp_StrCmp(G1CP_GetStringI(MEM_ReadInt(addr-9), 0, "G1CP invalid string 1"), CH1_GotoPsiCamp))
        || (!Hlp_StrCmp(G1CP_GetStringI(MEM_ReadInt(addr+6), 0, "G1CP invalid string 2"), CH1_GotoPsi)) {
            continue;
        };

        // Found what we are looking for
        MEMINT_OverrideFunc_Ptr = addr;
        MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_223_CarKalomSpyQuest_Topic1));
        MEMINT_OverrideFunc_Ptr = addrNext;
        MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_223_CarKalomSpyQuest_Topic2));

        applied = TRUE;
        break;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};

/*
 * Intercept the first call to "B_LogEntry"
 */
func void G1CP_223_CarKalomSpyQuest_Topic1(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbol locally
    const int LOG_RUNNING = 1;

    var C_Npc npc; npc = Hlp_GetNpc(G1CP_GetNpcInstId("Org_826_Mordrag"));
    if (G1CP_GetIntVar("Mordrag_GotoKalom", 0, 0) == LOG_RUNNING) && (!Npc_IsDead(npc)) {
        B_LogEntry(topic, entry);
    };
};

/*
 * Intercept the second call to "B_LogEntry"
 */
func void G1CP_223_CarKalomSpyQuest_Topic2(var string topic, var string entry) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbol locally
    const int LOG_RUNNING = 1;

    if (G1CP_GetIntVar("Raven_SpySect", 0, 0) == LOG_RUNNING) {
        B_LogEntry(topic, entry);
    };
};
