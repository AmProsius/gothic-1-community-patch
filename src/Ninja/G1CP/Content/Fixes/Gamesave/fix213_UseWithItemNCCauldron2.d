/*
 * #213 Cauldron in the New Camp can be used without a scoop pt. 2
 */
func int G1CP_213_UseWithItemNCCauldron2() {
    // Make sure the usage item actually exists
    const int symbId = -2;
    if (symbId == -2) {
        symbId = G1CP_GetItemInstID("ITMISCOOP");
    };
    if (symbId == -1) {
        return FALSE;
    };

    // Search the VOB
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-53449.8203, 2380.74316, 5637.86377);
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "CAULDRON"))
        && (Hlp_StrCmp(mob.useWithItem, "")) {
            mob.useWithItem = "ITMISCOOP";
            return TRUE;
        };
    };
    return FALSE;
};

/*
 * This function reverts the changes
 */
func int G1CP_213_UseWithItemNCCauldron2Revert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(213)) {
        return FALSE;
    };

    // Search the VOB again
    var int vobPtr; vobPtr = G1CP_FindVobByPosF(-53449.8203, 2380.74316, 5637.86377);
    if (Hlp_Is_oCMobInter(vobPtr)) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "CAULDRON"))
        && (Hlp_StrCmp(mob.useWithItem, "ITMISCOOP")) {
            mob.useWithItem = "";
            return TRUE;
        };
    };
    return FALSE;
};
