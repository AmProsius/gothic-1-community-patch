/*
 * Replace speaker and listener of matching output unit calls by replacing the pushed instance IDs. The speaker and
 * listener instances are expected as symbol indices. The function returns the number of replacements.
 * See G1CP_FindInCode for details on the first and second parameter.
 */
func int G1CP_ReplaceOUInst(var int funcIdOrStartAddr, var int zeroOrEndAddr, var string outputUnit,
                            var int needleIdSpeaker,  var int needleIdListener,
                            var int replaceIdSpeaker, var int replaceIdListener) {
    // Make sure all exist
    if (needleIdSpeaker < 0)   || (needleIdSpeaker >= MEM_Parser.symtab_table_numInArray)
    || (needleIdListener < 0)  || (needleIdListener >= MEM_Parser.symtab_table_numInArray)
    || (replaceIdSpeaker < 0)  || (replaceIdSpeaker >= MEM_Parser.symtab_table_numInArray)
    || (replaceIdListener < 0) || (replaceIdListener >= MEM_Parser.symtab_table_numInArray) {
        return 0;
    };

    // Find all matching output units calls
    const int bytes[2] = {zPAR_TOK_CALLEXTERN<<24, -1};
    bytes[1] = MEM_GetFuncID(AI_Output);
    var int matches; matches = G1CP_FindInCode(funcIdOrStartAddr, zeroOrEndAddr, _@(bytes)+3, 5, 0);

    // Iterate over all calls and check the function arguments
    var int count; count = 0;
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Read the arguments
        var int arg1; arg1 = MEM_ReadInt(pos-14); // zPAR_TOK_PUSHINST instance
        var int arg2; arg2 = MEM_ReadInt(pos-9);  // zPAR_TOK_PUSHINST instance
        var int arg3; arg3 = MEM_ReadInt(pos-4);  // zPAR_TOK_PUSHVAR  string

        // Confirm: AI_Output(needleIdSpeaker, needleIdListener, outputUnit);
        if (arg1 == needleIdSpeaker) && (arg2 == needleIdListener)
        && (Hlp_StrCmp(G1CP_GetStringI(arg3, 0, "G1CP invalid string"), outputUnit)) { // Either var or const

            // Assign new speaker and listener: AI_Output(replaceIdSpeaker, replaceIdListener, outputUnit);
            MEMINT_OverrideFunc_Ptr = pos-15;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceIdSpeaker);
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceIdListener);
            count += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return count;
};
