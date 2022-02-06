/*
 * #14 The player can cancel fights by entering a room
 */
func int G1CP_014_PortalCancelFight() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = G1CP_GetFuncId("B_CombatAssessEnterRoom", "void|none");
    if (funcId == -1)
    || (!G1CP_IsFunc("ZS_ClearRoom", "void|none")) || (!G1CP_IsFunc("ZS_ClearRoomWait", "void|none")) {
        return FALSE;
    };

    // Find the first if-block in the function
    var int matches; matches = G1CP_FindInFunc(funcId, _@(zPAR_TOK_JUMPF), 1);
    if (MEM_ArraySize(matches) > 0) {
        /* Assume the first if-block spans the entire function (i.e. until the end), like so

            func void B_CombatAssessEnterRoom() {
                if (...) {

                }; // End of function
            };
        */
        var int pos; pos = MEM_ArrayRead(matches, 0);
        var int target; target = MEM_ReadInt(pos+1);                         // Check what's after the if-block
        if (MEM_ReadByte(target + MEM_Parser.stack_stack) == zPAR_TOK_RET) { // Function returns: Assumption correct!

            // Add another condition to the if-statement
            G1CP_AddIfCondition(pos, zPAR_OP_LOG_AND, G1CP_014_PortalCancelFight_Condition);

            // Success
            applied = TRUE;
        };
    };

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * Additional condition
 */
func int G1CP_014_PortalCancelFight_Condition() {
    G1CP_ReportFuncToSpy();

    // Npc_WasInState(self, ZS_ClearRoom)
    var int state1;
    MEM_PushInstParam(self);
    MEM_PushIntParam(MEM_GetSymbolIndex("ZS_ClearRoom")); // Cannot push func directly
    MEM_Call(Npc_WasInState);
    state1 = MEM_PopIntResult();

    // Npc_WasInState(self, ZS_ClearRoomWait)
    var int state2;
    MEM_PushInstParam(self);
    MEM_PushIntParam(MEM_GetSymbolIndex("ZS_ClearRoomWait")); // Cannot push func directly
    MEM_Call(Npc_WasInState);
    state2 = MEM_PopIntResult();

    // Add new condition
    return (state1) || (state2);
};
