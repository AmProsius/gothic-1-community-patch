/**
 * Assign new speaker and listener to dialog line.
 *
 * @param funcId The ID of the info function of the dialog line.
 * @param ou The output sample.
 * @param needleSpeaker The current speaker. Accepts `self`, `other` and `hero`.
 * @param needleListener The current listener. Accepts `self`, `other` and `hero`.
 * @param replaceSpeaker The new speaker. Accepts `self`, `other` and `hero`.
 * @param replaceListener The new listener. Accepts `self`, `other` and `hero`.
 * @return number of replacements.
 */
func int G1CP_OUReplaceInst(var int funcId, var string ou, var int needleSpeaker, var int needleListener, 
                            var int replaceSpeaker, var int replaceListener) {
    var int count; count = 0;

    // Find all output units
    const int bytes[2] = {zPAR_TOK_CALLEXTERN<<24, -1};
    bytes[1] = MEM_GetFuncID(AI_Output);
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Iterate over all output units and check the function arguments
    repeat(i, MEM_ArraySize(matches)); var int i;
        var int pos; pos = MEM_ArrayRead(matches, i);

        // Read the arguments
        var int arg1; arg1 = MEM_ReadInt(pos-14); // zPAR_TOK_PUSHINST instance
        var int arg2; arg2 = MEM_ReadInt(pos-9);  // zPAR_TOK_PUSHINST instance
        var int arg3; arg3 = MEM_ReadInt(pos-4);  // zPAR_TOK_PUSHVAR  string

        // Confirm: AI_Output(needleSpeaker, needleListener, ou);
        if (arg1 == needleSpeaker) && (arg2 == needleListener)
        && (Hlp_StrCmp(G1CP_GetStringVarByIndex(arg3, 0, ""), ou)) {

            // Assign new speaker and listener
            MEMINT_OverrideFunc_Ptr = pos-15;
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceSpeaker);
            MEMINT_OFTokPar(zPAR_TOK_PUSHINST, replaceListener);

            count += 1;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return count;
};
