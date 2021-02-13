/*
 * #11 Player can pass guards in combat mode
 */
func int Ninja_G1CP_011_PassGuardsCombatMode() {
    var int applied; applied = FALSE;

    // Check if all necessary symbols exist
    var int funcId; funcId = MEM_FindParserSymbol("B_AssessFighter");
    var int checkInfoSymbPtr; checkInfoSymbPtr = MEM_GetSymbol("B_CheckForImportantInfo");
    if (funcId == -1) || (!checkInfoSymbPtr) {
        return FALSE;
    };

    // Get function offsets
    var int checkInfoOffset; checkInfoOffset = MEM_ReadInt(checkInfoSymbPtr + zCParSymbol_content_offset);
    var int interceptOffset; interceptOffset = MEM_GetFuncOffset(Ninja_G1CP_011_CheckInfo);

    /* Expected byte code within the function
        ...
        zPAR_TOK_JUMPF           +20
        zPAR_TOK_PUSH...         xxxx
        zPAR_TOK_PUSH...         xxxx
        zPAR_TOK_CALL            B_CheckForImportantInfo
        ...
    */

    // Search for "B_CheckForImportantInfo(xxxx, xxxx)" in "B_AssessFighter"
    const int bytes[2] = {zPar_TOK_CALL<<24, -1};
    bytes[1] = checkInfoOffset;
    var int matches; matches = Ninja_G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Iterate over all occurrences of "B_CheckForImportantInfo(xxxx, xxxx)"
    repeat(i, MEM_ArraySize(matches)); var int i;
        // Check if it is enclosed in an if-block without processing the return value (jumps to immediately after)
        var int pos; pos = MEM_ArrayRead(matches, i);
        if (MEM_ReadByte(pos-15) == zPAR_TOK_JUMPF)
        && (MEM_ReadInt(pos-14)  == pos+5 - currParserStackAddress) {
            // Now we can almost guarantee that the return value is not popped

            /* Write byte code to wrap the function call in an if-block and return if true
                if (Ninja_G1CP_011_CheckInfo(xxxx, xxxx)) { // B_CheckForImportantInfo has issues (see below)
                    return; // Abort the function "B_AssessFighter"
                } else {
                    jump to after the original function call // Continue in the function "B_AssessFighter"
                };
            */
            var int ptr; ptr = MEM_Alloc(11);
            MEMINT_OverrideFunc_Ptr = ptr;
            MEMINT_OFTokPar(zPAR_TOK_CALL,  interceptOffset);
            MEMINT_OFTokPar(zPAR_TOK_JUMPF, MEM_ReadInt(pos-14));
            MEMINT_OFTok(zPAR_TOK_RET);

            // Overwrite the call to jump to the above created byte code
            MEMINT_OverrideFunc_Ptr = pos;
            MEMINT_OFTokPar(zPAR_TOK_JUMP, ptr - currParserStackAddress);

            /* The byte code will now look like this

            B_AssessFighter:
                zPAR_TOK_JUMPF           +20
                zPAR_TOK_PUSH...         xxxx
                zPAR_TOK_PUSH...         xxxx
                zPAR_TOK_JUMP            new byte code

            new byte code:
                zPAR_TOK_CALL            Ninja_G1CP_011_CheckInfo
                zPAR_TOK_JUMPF           back to where we came from
                zPAR_TOK_RET
            */

            applied = TRUE;
        };
    end;

    return applied;
};

/*
 * Intercept the call to "B_CheckForImportantInfo" and inject new conditions for guards
 */
func int Ninja_G1CP_011_CheckInfo(var C_Npc slf, var C_Npc oth) {
    Ninja_G1CP_ReportFuncToSpy();

    // The original function call to "B_CheckForImportantInfo" has issues with distances to the player:
    // It triggers a dialog even if the NPC is too far way. Instead, just check for infos (instead of triggering them).
    var int cond1; cond1 = Npc_CheckInfo(slf, 1);

    // Additional condition: Is the NPC a guard and is the player trespassing?
    // Npc_IsInState(slf, ZS_GuardPassage)
    MEM_PushInstParam(slf);
    MEM_FindParserSymbol("ZS_GuardPassage"); // Cannot push integer
    MEM_Call(Npc_IsInState);
    var int cond2; cond2 = (MEM_PopIntResult()) && (Ninja_G1CP_GetAIVar(hero, "AIV_GUARDPASSAGE_STATUS", 0) > 0);

    // Abort "B_AssessFighter" if either condition is met
    return (cond1) || (cond2);
};
