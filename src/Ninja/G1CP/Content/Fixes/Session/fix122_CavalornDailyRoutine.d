/*
 * #122 Cavalorn WPs for his routine are reversed
 */
func int Ninja_G1CP_122_CavalornDailyRoutine() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = MEM_FindParserSymbol("Rtn_start_336");
    var int sleepSymbPtr; sleepSymbPtr = MEM_GetSymbol("TA_Sleep");
    var int standSymbPtr; standSymbPtr = MEM_GetSymbol("TA_StandAround");
    if (funcId == -1) || (!sleepSymbPtr) || (!standSymbPtr) {
        return FALSE;
    };

    // Find function calls in "Rtn_start_336"
    const int bytes[2] = {zPAR_TOK_CALL<<24, -1};

    // Find all calls to TA_Sleep"
    bytes[1] = MEM_ReadInt(sleepSymbPtr + zCParSymbol_content_offset);
    var int sleepMatches; sleepMatches = Ninja_G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Find all calls to "TA_StandAround"
    bytes[1] = MEM_ReadInt(standSymbPtr + zCParSymbol_content_offset);
    var int standMatches; standMatches = Ninja_G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

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
            if (varId > 0) && (varId < currSymbolTableLength) {
                varSymbPtr = MEM_GetSymbolByIndex(varId);
                if (varSymbPtr) {
                    symb = _^(varSymbPtr);
                    if ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
                        str = MEM_ReadString(symb.content);
                        if (Hlp_StrCmp(str, "OW_CAVALORN_01")) {
                            i += 1;
                            continue;
                        };
                    };
                };
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
            if (varId > 0) && (varId < currSymbolTableLength) {
                varSymbPtr = MEM_GetSymbolByIndex(varId);
                if (varSymbPtr) {
                    symb = _^(varSymbPtr);
                    if ((symb.bitfield & zCPar_Symbol_bitfield_type) == zPAR_TYPE_STRING) {
                        str = MEM_ReadString(symb.content);
                        if (Hlp_StrCmp(str, "OW_SAWHUT_SLEEP_01")) {
                            i += 1;
                            continue;
                        };
                    };
                };
            };
        };

        // If not matched, remove that match (array will no longer be ordered!)
        MEM_ArrayRemoveIndex(standMatches, i);
    end;

    // Check if any matches are left
    if (MEM_ArraySize(sleepMatches) > 0) && (MEM_ArraySize(standMatches) > 0) {
        // Get symbol indices of the strings
        const string wpSleep = "OW_SAWHUT_SLEEP_01";
        const string wpStand = "OW_CAVALORN_01";
        var int wpSleepSymbId; wpSleepSymbId = MEM_FindParserSymbol("Ninja_G1CP_122_CavalornDailyRoutine.wpSleep");
        var int wpStandSymbId; wpStandSymbId = MEM_FindParserSymbol("Ninja_G1CP_122_CavalornDailyRoutine.wpStand");

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
