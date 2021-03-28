/*
 * #52 MOBs in New Camp can be used without corresponding items
 */
func int G1CP_052_UseWithItemNCGrindstone() {
    // Make sure the usage item actually exists
    const int symbId = -2;
    if (symbId == -2) {
        symbId = MEM_GetSymbolIndex("ItMiSwordBlade");
    };
    if (symbId == -1) {
        return FALSE;
    };

    // Search the VOB
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-58212.9141, 3233.08716, 7490.75928);
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "BSSHARP"))
        && (Hlp_StrCmp(mob.useWithItem, "")) {
            mob.useWithItem = "ITMISWORDBLADE";
            return TRUE;
        };
    };
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_052_UseWithItemNCGrindstoneRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(52)) {
        return FALSE;
    };

    // Search the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-58212.9141, 3233.08716, 7490.75928);
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "BSSHARP"))
        && (Hlp_StrCmp(mob.useWithItem, "ITMISWORDBLADE")) {
            mob.useWithItem = "";
            return TRUE;
        };
    };
    return FALSE;
};
