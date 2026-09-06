/*
 * #212 Cauldron in the New Camp can be used without a scoop pt. 1
 */
const float G1CP_0212_UseWithItemNcCauldron1_Pos[3] = {-56066.3008, 2590.51416, 2028.71448};

/*
 * Apply the fix
 */
func int G1CP_0212_UseWithItemNcCauldron1() {
    // Make sure the usage item actually exists
    const int symbId = -2;
    if (symbId == -2) {
        symbId = G1CP_GetItemInstId("ITMISCOOP");
    };
    if (symbId == -1) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0212_UseWithItemNcCauldron1_Pos), Hlp_Is_oCMobInter);
    if (vobPtr) {
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
 * Revert the changes
 */
func int G1CP_0212_UseWithItemNcCauldron1Revert() {
    // Only revert if it was applied by the G1CP
    if (!G1CP_IsFixApplied(212)) {
        return FALSE;
    };

    var int vobPtr; vobPtr = G1CP_FindVobByPosPtr(_@f(G1CP_0212_UseWithItemNcCauldron1_Pos), Hlp_Is_oCMobInter);
    if (vobPtr) {
        var oCMobInter mob; mob  = _^(vobPtr);
        if (Hlp_StrCmp(mob.sceme, "CAULDRON"))
        && (Hlp_StrCmp(mob.useWithItem, "ITMISCOOP")) {
            mob.useWithItem = "";
            return TRUE;
        };
    };
    return FALSE;
};
