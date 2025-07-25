/*
 * #122 Cavalorn WPs for his routine are reversed
 */
func int G1CP_0122_CavalornDailyRoutine() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = G1CP_GetFuncId("Rtn_start_336", "void|none");
    var int sleepSymbId; sleepSymbId = G1CP_GetFuncId("TA_Sleep", "void|int|int|int|int|string");
    var int standSymbId; standSymbId = G1CP_GetFuncId("TA_StandAround", "void|int|int|int|int|string");
    if (funcId == -1) || (sleepSymbId == -1) || (standSymbId == -1) {
        return FALSE;
    };

    // Find function calls in "Rtn_start_336"
    const int bytes[2] = {zPAR_TOK_CALL<<24, -1};

    // Find all calls to "TA_Sleep"
    bytes[1] = G1CP_GetCallableOffsetI(sleepSymbId);
    var int sleepMatches; sleepMatches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Find all calls to "TA_StandAround"
    bytes[1] = G1CP_GetCallableOffsetI(standSymbId);
    var int standMatches; standMatches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Narrow down the context
    var int i; i = 0;
    var int pos;
    var int varId;
    var int varSymbPtr;
    var zCPar_Symbol symb;
    var string str;

    // Confirm that the waypoint is "OW_CAVALORN_01"
    while(i < MEM_ArraySize(sleepMatches));
        pos = MEM_ArrayRead(sleepMatches, i);
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            varId = MEM_ReadInt(pos-4);
            if (Hlp_StrCmp(G1CP_GetStringI(varId, 0, ""), "OW_CAVALORN_01")) {
                i += 1;
                continue;
            };
        };

        // If not matched, remove that match (array will no longer be ordered!)
        MEM_ArrayRemoveIndex(sleepMatches, i);
    end;

    // Confirm that the waypoint is "OW_SAWHUT_SLEEP_01"
    while(i < MEM_ArraySize(standMatches));
        pos = MEM_ArrayRead(standMatches, i);
        if (MEM_ReadByte(pos-5) == zPAR_TOK_PUSHVAR) {
            varId = MEM_ReadInt(pos-4);
            if (Hlp_StrCmp(G1CP_GetStringI(varId, 0, ""), "OW_SAWHUT_SLEEP_01")) {
                i += 1;
                continue;
            };
        };

        // If not matched, remove that match (array will no longer be ordered!)
        MEM_ArrayRemoveIndex(standMatches, i);
    end;

    // Check if any matches are left
    if (MEM_ArraySize(sleepMatches) > 0) && (MEM_ArraySize(standMatches) > 0) {
        // Get symbol indices of the strings
        var MEMINT_HelperClass ref;
        const string wpSleep = "OW_SAWHUT_SLEEP_01";
        const string wpStand = "OW_CAVALORN_01";
        var int wpSleepSymbId; wpSleepSymbId = ref + 1;
        var int wpStandSymbId; wpStandSymbId = ref + 2;

        // Switch the waypoints in all remaining occurrences
        repeat(i, MEM_ArraySize(sleepMatches));
            pos = MEM_ArrayRead(sleepMatches, i);
            MEMINT_OverrideFunc_Ptr = pos-5;
            MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, wpSleepSymbId);
        end;
        repeat(i, MEM_ArraySize(standMatches));
            pos = MEM_ArrayRead(standMatches, i);
            MEMINT_OverrideFunc_Ptr = pos-5;
            MEMINT_OFTokPar(zPAR_TOK_PUSHVAR, wpStandSymbId);
        end;

        // Successful
        applied = TRUE;
    };

    // Free the arrays
    MEM_ArrayFree(sleepMatches);
    MEM_ArrayFree(standMatches);

    return applied;
};
