/*
 * #20 Kirgo doesn't give a beer to the player
 */
func int G1CP_0020_KirgoGivesBeer() {
    var int applied; applied = FALSE;

    // Get necessary symbol indices
    var int funcId; funcId = G1CP_GetFuncId("Info_Kirgo_Charge_Beer", "void|none");
    var int giveId; giveId = G1CP_GetFuncId("B_GiveInvItems", "void|inst|inst|int|int");
    var int beerId; beerId = G1CP_GetItemInstId("ItFoBeer");
    if (funcId == -1) || (giveId == -1) || (beerId == -1) {
        return FALSE;
    };

    /* Find the following in "Info_Kirgo_Charge_Beer"

    CreateInvItem(other, ItFoBeer);
    B_GiveInvItems(other, self, ItFoBeer, 1);
    */
    var int bytes[10]; // 40 / 4
    MEMINT_OverrideFunc_Ptr = _@(bytes);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST, other);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, beerId);
    MEMINT_OFTokPar(zPAR_TOK_CALLEXTERN, MEM_GetFuncId(CreateInvItem));
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST, other);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINST, self);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, beerId);
    MEMINT_OFTokPar(zPAR_TOK_PUSHINT, 1);
    MEMINT_OFTokPar(zPAR_TOK_CALL, G1CP_GetCallableOffsetI(giveId));
    var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes), 40);

    // There has to be exactly one match
    if (MEM_ArraySize(matches) == 1) {
        var int addr; addr = MEM_ArrayRead(matches, 0);

        // Replace the other with self in CreateInvItem(other, ItFoBeer)
        MEMINT_OverrideFunc_Ptr = addr;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINST, self);

        // Switch the other and self in B_GiveInvItems(other, self, ItFoBeer, 1)
        MEMINT_OverrideFunc_Ptr = addr+15;
        MEMINT_OFTokPar(zPAR_TOK_PUSHINST, self);
        MEMINT_OFTokPar(zPAR_TOK_PUSHINST, other);

        applied = TRUE;
    };

    // Free the array
    MEM_ArrayFree(matches);

    return applied;
};
