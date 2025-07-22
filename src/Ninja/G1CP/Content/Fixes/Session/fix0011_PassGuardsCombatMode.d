/*
 * #11 Player can pass guards in combat mode
 */
func int G1CP_0011_PassGuardsCombatMode() {
    var int applied; applied = FALSE;

    // Check if all necessary symbols exist
    var int funcId; funcId = G1CP_GetFuncId("B_AssessFighter", "void|none");
    var int checkInfoId; checkInfoId = G1CP_GetFuncId("B_CheckForImportantInfo", "int|inst|inst");
    if (funcId == -1) || (checkInfoId == -1) {
        return FALSE;
    };

    // Get function offsets
    var int checkInfoOffset; checkInfoOffset = G1CP_GetCallableOffsetI(checkInfoId);
    var int interceptOffset; interceptOffset = MEM_GetFuncOffset(G1CP_0011_CheckInfo);

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
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

    // Iterate over all occurrences of "B_CheckForImportantInfo(xxxx, xxxx)"
    repeat(i, MEM_ArraySize(matches)); var int i;
        // Check if it is enclosed in an if-block without processing the return value (jumps to immediately after)
        var int pos; pos = MEM_ArrayRead(matches, i);
        if (MEM_ReadByte(pos-15) == zPAR_TOK_JUMPF)
        && (MEM_ReadInt(pos-14)  == pos+5 - MEM_Parser.stack_stack) {
            // Now we can almost guarantee that the return value is not popped

            /* Write byte code to wrap the function call in an if-block and return if true
                if (G1CP_0011_CheckInfo(xxxx, xxxx)) { // B_CheckForImportantInfo has issues (see below)
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
            MEMINT_OFTokPar(zPAR_TOK_JUMP, ptr - MEM_Parser.stack_stack);

            /* The byte code will now look like this

            B_AssessFighter:
                zPAR_TOK_JUMPF           +20
                zPAR_TOK_PUSH...         xxxx
                zPAR_TOK_PUSH...         xxxx
                zPAR_TOK_JUMP            new byte code

            new byte code:
                zPAR_TOK_CALL            G1CP_0011_CheckInfo
                zPAR_TOK_JUMPF           back to where we came from
                zPAR_TOK_RET
            */

            applied = TRUE;
        };
    end;

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};

/*
 * Intercept the call to "B_CheckForImportantInfo" and inject new conditions for guards
 */
func int G1CP_0011_CheckInfo(var C_Npc slf, var C_Npc oth) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int PERC_ASSESSTALK  = 19;
    const int PERC_DIST_DIALOG = 0;
    const int oCNpc__percRange = 9288224; //0x8DBA20
    PERC_DIST_DIALOG = roundf(MEM_ReadIntArray(oCNpc__percRange, PERC_ASSESSTALK));

    // The original function call to "B_CheckForImportantInfo" has issues with distances to the player:
    // It triggers a dialog even if the NPC is too far way. Instead, just check for infos (instead of triggering them).
    var int cond1; cond1 = Npc_CheckInfo(slf, 1);

    // Check if the player is in range to trigger the dialog (a check that is missing in "B_CheckForImportantInfo")
    if (cond1) {
        if (Npc_CanSeeNpcFreeLos(slf, oth)) && (Npc_GetDistToNpc(slf, oth) < PERC_DIST_DIALOG) {
            // B_CheckForImportantInfo(slf, oth)
            MEM_PushInstParam(slf);
            MEM_PushInstParam(oth);
            MEM_CallByString("B_CheckForImportantInfo");
        };
    };

    // Additional condition: Is the NPC a guard and is the player trespassing?
    // Npc_IsInState(slf, ZS_GuardPassage)
    MEM_PushInstParam(slf);
    G1CP_GetFuncId("ZS_GuardPassage", "void|none"); // Cannot push integer
    MEM_Call(Npc_IsInState);
    var int cond2; cond2 = (MEM_PopIntResult()) && (G1CP_NpcGetAiVar(hero, "AIV_GUARDPASSAGE_STATUS", 0) > 0);

    // Abort "B_AssessFighter" if either condition is met
    return (cond1) || (cond2);
};
