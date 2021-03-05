/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 */

/*
 * Retrieve the symbol index of the NPC
 */
func int Ninja_G1CP_124_GateGuardID_GetInst() {
    const int guardId = -2; // -1 is reserved for invalid symbols
    if (guardId == -2) {
        guardId = MEM_FindParserSymbol("GRD_280_Gardist");
    };
    return guardId;
};

/*
 * Retrieve the exact code address in the instance function
 */
func int Ninja_G1CP_124_GateGuardID_CodePosPtr() {
    const int codePosPtr = 0;
    const int once = FALSE;
    if (!once) {
        once = TRUE;
        const int bytes[3] = {zPar_TOK_PUSHVAR<<24, -1, zPAR_OP_IS};
        bytes[1] = MEM_FindParserSymbol("C_Npc.id");
        var int matches; matches = Ninja_G1CP_FindInFunc(Ninja_G1CP_124_GateGuardID_GetInst(), _@(bytes)+3, 6);
        if (matches) {
            if (MEM_ArraySize(matches)) {
                codePosPtr = MEM_ArrayLast(matches) - 4;
            };
            MEM_ArrayFree(matches);
        };
    };
    return codePosPtr;
};

/*
 * Detailed status of this fix for reverting it (internal purposes)
 */
const int Ninja_G1CP_124_GateGuardID_Status = 0;

/*
 * This function applies the changes of #124
 */
func int Ninja_G1CP_124_GateGuardID() {
    // Two parts, change an existing NPC and change the instance function
    if (!Ninja_G1CP_IsFixApplied(124)) {
        // Only reset if the fix was reverted
        Ninja_G1CP_124_GateGuardID_Status = 0;
    };

    // Part 1: Check for existing NPC
    var int guardId; guardId = Ninja_G1CP_124_GateGuardID_GetInst();
    var C_Npc guard; guard = Hlp_GetNpc(guardId);
    if (Hlp_IsValidNpc(guard)) {
        if (guard.id == 230) {
            guard.id = 280;
            Ninja_G1CP_124_GateGuardID_Status = (Ninja_G1CP_124_GateGuardID_Status | 1);
        };
    };

    // Part 2: Overwrite bytes in the instance function
    var int codePosPtr; codePosPtr = Ninja_G1CP_124_GateGuardID_CodePosPtr();
    if (codePosPtr) {
        if (MEM_ReadInt(codePosPtr) == 230) {
            MEM_WriteInt(codePosPtr, 280);
            Ninja_G1CP_124_GateGuardID_Status = (Ninja_G1CP_124_GateGuardID_Status | 2);
        };
    };

    // If any part of the fix was applied, return true
    return (Ninja_G1CP_124_GateGuardID_Status != 0);
};

/*
 * This function reverts the changes of #124
 */
func int Ninja_G1CP_124_GateGuardIDRevert() {
    // Revert the fix in two parts, change an existing NPC and change the instance function

    // Part 1: Check for existing NPC
    if (Ninja_G1CP_124_GateGuardID_Status & 1) {
        var int guardId; guardId = Ninja_G1CP_124_GateGuardID_GetInst();
        var C_Npc guard; guard = Hlp_GetNpc(guardId);
        if (Hlp_IsValidNpc(guard)) {
            guard.id = 230;
            Ninja_G1CP_124_GateGuardID_Status = (Ninja_G1CP_124_GateGuardID_Status & ~1);
        };
    };

    // Part 2: Overwrite bytes in the instance function
    if (Ninja_G1CP_124_GateGuardID_Status & 2) {
        var int codePosPtr; codePosPtr = Ninja_G1CP_124_GateGuardID_CodePosPtr();
        if (codePosPtr) {
            MEM_WriteInt(codePosPtr, 230);
            Ninja_G1CP_124_GateGuardID_Status = (Ninja_G1CP_124_GateGuardID_Status & ~2);
        };
    };

    // Return true if everything was reverted
    return (Ninja_G1CP_124_GateGuardID_Status == 0);
};
