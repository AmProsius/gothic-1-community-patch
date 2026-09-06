/*
 * #52 MOBs in New Camp can be used without corresponding items
 */
const float G1CP_0052_UseWithItemNcGrindstone_Pos[3] = {-58212.9141, 3233.08716, 7490.75928};

/*
 * Apply the fix
 */
func int G1CP_0052_UseWithItemNcGrindstone() {
    // Make sure the usage item actually exists
    const int symbId = -2;
    if (symbId == -2) {
        symbId = G1CP_GetItemInstId("ItMiSwordBlade");
    };
    if (symbId == -1) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0052_UseWithItemNcGrindstone_Pos), Hlp_Is_oCMobInter);
    if (vobPtr) {
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
 * Revert the changes
 */
func int G1CP_0052_UseWithItemNcGrindstoneRevert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(52)) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0052_UseWithItemNcGrindstone_Pos), Hlp_Is_oCMobInter);
    if (vobPtr) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "BSSHARP"))
        && (Hlp_StrCmp(mob.useWithItem, "ITMISWORDBLADE")) {
            mob.useWithItem = "";
            return TRUE;
        };
    };
    return FALSE;
};
