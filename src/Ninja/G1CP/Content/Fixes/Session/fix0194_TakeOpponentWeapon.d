/*
 * #194 NPCs do not collect the weapon after defeating an opponent
 */
func int G1CP_0194_TakeOpponentWeapon() {
    var int applied; applied = FALSE;

    var int funcId; funcId = G1CP_GetFuncId("ZS_AssessBody_RecoverWeapon", "void|none");
    var int detectId; detectId = MEM_GetFuncId(Wld_DetectItem);
    var int distItmId; distItmId = MEM_GetFuncId(Npc_GetDistToItem);
    if (funcId == -1) {
        return FALSE;
    };

    // Find all calls to "Wld_DetectItem" in "ZS_AssessBody_RecoverWeapon"
    var int matches; matches = G1CP_FindCall(funcId, 0, detectId);

    // Iterate over all occurrences to find the specific match
    repeat(i, MEM_ArraySize(matches)-1); var int i;
        var int addr; addr = MEM_ArrayRead(matches, i);
        var int addrNext; addrNext = MEM_ArrayRead(matches, i+1);

        /* We are looking for

        -26 x                        xxxx                      <-- create a call here
        -21 x                        xxxx                      <-- create a jump here to [X]
        -16 zPAR_TOK_CALLEXTERN      Npc_GetDistToItem
        -11 x
        -10 x                        xxxx
         -5 x                        xxxx
          0 zPAR_TOK_CALLEXTERN      Wld_DetectItem            <-- this is addr
         +5 x                        xxxx
        +10 x                        xxxx
        +15 zPAR_TOK_CALLEXTERN      Wld_DetectItem            <-- this is addrNext
        +20 zPAR_OP_LOG_OR
        +21 zPAR_OP_LOG_AND
        +22 zPAR_TOK_JUMPF                                     <-- [X]
        */

        // First, check position of the next found call and the valid ranges
        if (addrNext != addr+15) || (G1CP_GetFuncStart(funcId) > addr-26) || (G1CP_GetFuncEnd(funcId) < addr+22) {
            continue;
        };

        // Next, check the context
        if (MEM_ReadByte(addr-16) != zPAR_TOK_CALLEXTERN) || (MEM_ReadInt(addr-15) != distItmId)
        || (MEM_ReadByte(addr+20) != zPAR_OP_LOG_OR)
        || (MEM_ReadByte(addr+21) != zPAR_OP_LOG_AND)
        || (MEM_ReadByte(addr+22) != zPAR_TOK_JUMPF) {
            continue;
        };

        // Overwrite the call to "Npc_GetDistToItem"
        MEMINT_OverrideFunc_Ptr = addr-26;
        MEMINT_OFTokPar(zPAR_TOK_CALL, MEM_GetFuncOffset(G1CP_0194_TakeOpponentWeapon_Cond));

        // Jump beyond the faulty original code
        MEMINT_OverrideFunc_Ptr = addr-21;
        MEMINT_OFTokPar(zPAR_TOK_JUMP, addr+22 - MEM_Parser.stack_stack);

        applied = TRUE;
        break;
    end;

    // Free the array
    MEM_ArrayFree(matches);

    // Return success
    return applied;
};

/*
 * Intercept the if-condition to validate the global symbol "item"
 */
func int G1CP_0194_TakeOpponentWeapon_Cond(var int distance) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int ITEM_KAT_NF = 1 << 1;
    const int ITEM_KAT_FF = 1 << 2;

    // Set "item" correctly
    if (!Wld_DetectItem(self, ITEM_KAT_NF)) {
        if (!Wld_DetectItem(self, ITEM_KAT_FF)) {
            return FALSE;
        };
    };

    return (Npc_GetDistToItem(self, item) < distance);
};
